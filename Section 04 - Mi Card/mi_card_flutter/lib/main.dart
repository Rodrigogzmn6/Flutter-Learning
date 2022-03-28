import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 300.0,
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
                  SizedBox(
                    height: 20.0,
                    width: 200,
                    child: Divider(
                      height: 1.0,
                      color: Colors.orange.shade300,
                    ),
                  ),
                  Card(
                    color: Colors.orange,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blueGrey.shade900,
                      ),
                      title: Text(
                        '+54 3865 405769',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Source Sans Pro', color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.orange,
                    child: ListTile(
                      leading: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.blueGrey.shade900,
                      ),
                      title: Text(
                        'rodrigoguzman6796@gmail.com',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Source Sans Pro', color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}