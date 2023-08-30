import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'What needs to be done?',
            ),
            onSubmitted: (value) => print('submit new todo $value'),
          ),
          const SizedBox(
            height: 42.0,
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 16.0,
            ),
            child: Text(
              'X items left',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          const Item(),
          const Item(),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 6.0,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 70.0,
        ),
        child: ListTile(
          onTap: () => print('tapped'),
          leading: const Icon(
            Icons.task_alt,
            color: Colors.blue,
            size: 18.0,
          ),
          trailing: Wrap(
            children: [
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, elevation: 0.0),
                    onPressed: () {},
                    child: const Text('Start'),
                  ),
                  const Text(
                    "00:00:00",
                    style: TextStyle(fontSize: 11.0),
                  ),
                ],
              ),
            ],
          ),
          title: const Text('Some text'),
        ),
      ),
    );
  }
}
