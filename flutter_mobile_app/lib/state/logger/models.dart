enum LogLevel {
  error(30),
  warn(20),
  info(10);

  const LogLevel(this.rawValue);
  final int rawValue;
}

class LogFilter {
  const LogFilter({
    required this.minLevel,
    required this.layers,
  });

  final LogLevel minLevel;
  final List<Layer> layers;
}

enum Layer {
  logic,
  state,
  view,
  external_,
}
