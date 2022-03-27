import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                child: Text('This is the container N° 1'),
                height: 100.0,
              ),
              Container(
                color: Colors.redAccent,
                child: Text('This is the container N° 1'),
                height: 100.0,
              ),
              Container(
                color: Colors.greenAccent,
                child: Text('This is the container N° 1'),
                height: 100.0,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    child: Text('This is the container N° 1'),
                    height: 100.0,
                  ),
                  Container(
                    color: Colors.redAccent,
                    child: Text('This is the container N° 1'),
                    height: 100.0,
                  ),
                  Container(
                    color: Colors.greenAccent,
                    child: Text('This is the container N° 1'),
                    height: 100.0,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
    );
  }
}
