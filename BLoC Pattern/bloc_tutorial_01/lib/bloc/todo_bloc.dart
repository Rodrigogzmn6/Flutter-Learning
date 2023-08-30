import 'package:bloc_tutorial_01/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {
    on<TodoListStarted>(_onStart);
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
    on<ToggleTodoEvent>(_toggleTodo);
  }

  _onStart(TodoListStarted event, Emitter<TodoState> emit) {
    emit(const TodoListLoadedState(items: []));
  }

  // AddTodo event handler which emits TodoAdded state
  _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoListLoadedState) {
      emit(TodoListLoadedState(items: [...state.items, event.todoObj]));
    }
  }

  // RemoveTodo event handler which emits TodoDeleted state
  _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoListLoadedState) {
      List<Item> items = state.items;
      items.removeWhere((element) => element.id == event.todoObj.id);

      emit(TodoListLoadedState(items: items));
    }
  }

  _toggleTodo(ToggleTodoEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoListLoadedState) {
      List<Item> items = List.from(state.items);
      int indexToChange =
          items.indexWhere((element) => element.id == event.todoObj.id);

      // If the element is found, we create a copy of the element with the `completed` field toggled.
      if (indexToChange != -1) {
        Item itemToChange = items[indexToChange];
        Item updatedItem = Item(
            description: itemToChange.description,
            completed: !itemToChange.completed);

        items[indexToChange] = updatedItem;
      }

      emit(TodoListLoadedState(items: [...items]));
    }
  }
}
