import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/swdv.jpg'),
                ),
                Text(
                  'Rodrigo I. Guzmán',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'TECHNICAL ANALYST II',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15.0,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
