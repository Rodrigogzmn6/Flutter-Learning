import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // The type of state that CounterCubit is managing is an int
  // and it starts in 0
  CounterCubit() : super(0);

  // Add 1 to the current state
  void increment() => emit(state + 1);

  // Subtract 1 from the current state
  void decrement() => emit(state - 1);
}
