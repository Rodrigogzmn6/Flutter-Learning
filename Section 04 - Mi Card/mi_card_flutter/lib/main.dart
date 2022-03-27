import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            children: [
              Container(
                color: Colors.red,
                height: double.infinity,
                width: 100.0,
              ),
              Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.lime,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Container(
                color: Colors.blue,
                height: double.infinity,
                width: 100.0,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
