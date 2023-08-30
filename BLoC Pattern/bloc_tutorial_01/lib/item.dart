import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Item {
  final String id = uuid.v4();
  final String description;
  final bool completed;
  final List<ItemTimer> _timersList = [];

  Item({required this.description, this.completed = false});

  // Add new timer that starts on current time
  startTimer() {
    if (_timersList.isEmpty) {
      _timersList.add(ItemTimer(end: null, start: DateTime.now()));
    } else {
      ItemTimer lastTimer = _timersList.last;

      // Only create a new timer if the last one is finished
      if (lastTimer.end != null) {
        _timersList.add(ItemTimer(end: null, start: DateTime.now()));
      }
    }
  }

  // Stop the timer that is at the end of the list
  stopTimer() {
    if (_timersList.isNotEmpty) {
      ItemTimer lastTimer = _timersList.last;

      // Only can stop last timer if the end is null
      if (lastTimer.end == null) {
        lastTimer.end = DateTime.now();
        _timersList[_timersList.length - 1] = lastTimer;
      }
    }
  }

  getCumulativeDuration() {
    if (_timersList.isEmpty) return Duration.zero;

    // Accumulate the duration of every timer
    Duration accumnulativeDuration = const Duration();
    for (ItemTimer timer in _timersList) {
      final stop = timer.end;
      if (stop != null) {
        accumnulativeDuration += stop.difference(timer.start);
      }
    }

    return accumnulativeDuration;
  }
}

class ItemTimer {
  final DateTime start;

  DateTime? end;

  ItemTimer({this.end, required this.start});
}
