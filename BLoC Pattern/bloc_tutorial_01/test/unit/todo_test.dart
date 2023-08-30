import 'dart:io';

import 'package:bloc_tutorial_01/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Cumulative duration after starting and stopping timer should be more than 0',
      () {
    const description = "description";

    final item = Item(description: description);

    // Checking attributes
    expect(item.description, description);

    // Start and stop timer
    item.startTimer();
    sleep(const Duration(seconds: 5));
    item.stopTimer();

    // Start and stop timer at another time
    item.startTimer();
    sleep(const Duration(seconds: 5));
    item.stopTimer();

    // Some time must have passed
    expect(item.getCumulativeDuration(), isNot(equals(0)));
  });

  test('Start timer multiple times and stopping timer will no error out', () {
    const description = "description";

    final item = Item(description: description);

    // Checking attributes
    expect(item.description, description);

    // Start timer mutiple times
    item.startTimer();
    item.startTimer();
    item.startTimer();

    // Some time must have passed
    expect(item.getCumulativeDuration(), isNot(equals(0)));
  });
}
