class TimerEx {
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _initialOffset;

  TimerEx({Duration initialOffset = Duration.zero})
      : _initialOffset = initialOffset;

  start() => _stopwatch.start();
  stop() => _stopwatch.stop();

  bool get isRunning => _stopwatch.isRunning;

  int get elapsedMiliseconds =>
      _stopwatch.elapsedMilliseconds + _initialOffset.inMilliseconds;
}
