import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Container(
            color: Colors.blueAccent,
            child: Text('This is a container'),
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 25.0),
            margin: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 10.0),
          ),
        ),
      ),
    );
  }
}
