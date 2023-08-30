import 'package:bloc_tutorial_02/counter/cubit/counter_cubit.dart';
import 'package:bloc_tutorial_02/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Separate the creation of a Cubit from its consumption
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}
