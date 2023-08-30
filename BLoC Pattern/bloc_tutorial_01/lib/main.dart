import 'dart:async';

import 'package:bloc_tutorial_01/bloc/todo_bloc.dart';
import 'package:bloc_tutorial_01/item.dart';
import 'package:bloc_tutorial_01/timer_ex.dart';
import 'package:bloc_tutorial_01/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final textfieldKey = UniqueKey();
final itemsLeftStringKey = UniqueKey();
final itemCardWidgetKey = UniqueKey();
final itemCardTimerButtonKey = UniqueKey();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(TodoListStarted()),
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _txtFieldController = TextEditingController();

  @override
  void dispose() {
    _txtFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            // If list is loaded
            if (state is TodoListLoadedState) {
              int numItemsLeft = state.items.length -
                  state.items.where((element) => element.completed).length;
              List<Item> items = state.items;
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                children: [
                  TextField(
                    key: textfieldKey,
                    controller: _txtFieldController,
                    decoration: const InputDecoration(
                      labelText: 'What needs to be done?',
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Item newItem = Item(description: value);
                        BlocProvider.of<TodoBloc>(context)
                            .add(AddTodoEvent(newItem));
                        // Clear textfield
                        _txtFieldController.clear();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 42.0,
                  ),
                  // Title for items left
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16.0,
                    ),
                    child: Text(
                      key: itemsLeftStringKey,
                      '$numItemsLeft items left',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  if (items.isNotEmpty)
                    const Divider(
                      height: 0,
                    ),

                  for (var i = 0; i < items.length; i++) ...[
                    if (i > 0)
                      const Divider(
                        height: 0,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ItemCard(
                        item: items[i],
                      ),
                    ),
                  ]
                ],
              );
            } else {
              return const Center(
                child: Text('Error loading items list.'),
              );
            }
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  // Timer to be displayed
  late TimerEx _timer;

  // Used to re-render the text showing the timer
  late Timer _stopwatch;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    _timer = TimerEx(initialOffset: widget.item.getCumulativeDuration());

    _stopwatch = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_timer.isRunning) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _stopwatch.cancel();
    super.dispose();
  }

  handleButtonClick() {
    // If timer is ongoing, we stop the stopwatch and the timer in the todo item.
    if (_timer.isRunning) {
      widget.item.stopTimer();
      _timer.stop();

      // Re-render
      setState(() {});
    }

    // If we are to start timer, start the timer in todo item and stopwatch.
    else {
      widget.item.startTimer();
      _timer.start();

      // Re-render
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: itemCardWidgetKey,
      color: Colors.white,
      elevation: 6,
      child: Container(
        constraints: const BoxConstraints(minHeight: 70),
        child: ListTile(
          onTap: () {
            // Create a ToggleTodo event to toggle the `complete` field
            context.read<TodoBloc>().add(ToggleTodoEvent(widget.item));
          },

          // Checkbox-style icon showing if it's completed or not
          leading: widget.item.completed
              ? const Icon(
                  Icons.task_alt,
                  color: Colors.blue,
                  size: 18.0,
                )
              : const Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.blue,
                  size: 18.0,
                ),

          // Start and stop timer with stopwatch text
          trailing: Wrap(
            children: [
              Column(
                children: [
                  ElevatedButton(
                    key: itemCardTimerButtonKey,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _timer.isRunning ? Colors.red : Colors.green,
                      elevation: 0,
                    ),
                    onPressed: handleButtonClick,
                    child: _timer.isRunning
                        ? const Text("Stop")
                        : const Text("Start"),
                  ),
                  Text(
                    formatTime(_timer.elapsedMiliseconds),
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              )
            ],
          ),

          // Todo item description
          title: Text(widget.item.description),
        ),
      ),
    );
  }
}
