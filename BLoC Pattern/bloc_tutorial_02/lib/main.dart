// import 'package:bloc_tutorial_02/app.dart';
// import 'package:bloc_tutorial_02/counter_observer.dart';
// import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';

// void main() {
//   Bloc.observer = const CounterObserver();
//   runApp(const CounterApp());
// }

import 'package:bloc_tutorial_02/counter/view/counter_page.dart';
import 'package:bloc_tutorial_02/counter/cubit/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}
