import 'package:bloc_tutorial_01/bloc/todo_bloc.dart';
import 'package:bloc_tutorial_01/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TodoEvent', () {
    group('TodoListStarted', () {
      test('supports value comparison', () {
        expect(TodoListStarted(), TodoListStarted());
      });
    });

    group('AddTodoEvent', () {
      final item = Item(description: "description");
      test('supports value comparison', () {
        expect(AddTodoEvent(item), AddTodoEvent(item));
      });
    });

    group('RemoveTodoEvent', () {
      final item = Item(description: "description");
      test('supports value comparison', () {
        expect(RemoveTodoEvent(item), RemoveTodoEvent(item));
      });
    });

    group('ToggleTodoEvent', () {
      final item = Item(description: "description");
      test('supports value comparison', () {
        expect(ToggleTodoEvent(item), ToggleTodoEvent(item));
      });
    });
  });
}
