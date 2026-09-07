#!/usr/bin/env python3
"""lib/ のレイヤー間の依存の向きを検査する。違反があれば exit 1。

依存は ui -> usecases -> ports の一方向のみ。
domain は他のどのレイヤーにも依存しない。
adapters は port を implements するだけで、usecases から名前を知られない。
"""
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'lib')
LAYERS = ['domain', 'usecases', 'ui', 'ports', 'adapters']

# 各レイヤーが import してよい行き先。自分自身は常に可。
# di.dart は composition root で、usecases が port の実体を受け取る唯一の口。
ALLOWED = {
    'domain':   set(),
    'ports':    {'domain'},
    'adapters': {'domain', 'ports'},
    'usecases': {'domain', 'ports', 'di.dart'},
    'ui':       {'domain', 'usecases', '__gen__'},
}

bad = []
for layer in LAYERS:
    for root, _, files in os.walk(os.path.join(ROOT, layer)):
        for name in files:
            if not name.endswith('.dart'):
                continue
            path = os.path.join(root, name)
            rel = os.path.relpath(root, ROOT)
            for uri in re.findall(r"^(?:import|export) '([^']+)'", open(path).read(), re.M):
                if uri.startswith(('package:', 'dart:')):
                    continue
                target = os.path.normpath(os.path.join(rel, uri)).split('/')[0]
                if target == layer or target in ALLOWED[layer]:
                    continue
                bad.append((os.path.relpath(path, ROOT), uri, target))

for path, uri, target in bad:
    print(f'違反: {path} -> {uri}  ({target} は許可されていません)')
print(f'レイヤー違反: {len(bad)}')
sys.exit(1 if bad else 0)
