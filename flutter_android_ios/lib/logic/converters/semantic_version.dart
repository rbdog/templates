import 'package:my_app/logic/types/semantic_version.dart';

class SemanticVersionConverter {
  SemanticVersion fromString(String versionString) {
    final parts = versionString.split('.').map(int.parse).toList();
    final major = parts[0];
    final minor = parts[1];
    final patch = parts[2];
    return SemanticVersion(
      major: major,
      minor: minor,
      patch: patch,
    );
  }
}
