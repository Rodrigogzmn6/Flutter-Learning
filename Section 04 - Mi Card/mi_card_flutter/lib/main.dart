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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                SizedBox(height: 10.0,),
                Container(
                  color: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blueGrey.shade900,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        '+54 3865 405769',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Source Sans Pro', color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  color: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.mail_rounded,
                        color: Colors.blueGrey.shade900,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'rodrigoguzman6796@gmail.com',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Source Sans Pro', color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold),
                      ),
                    ],
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
