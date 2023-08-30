import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Expanded noteKey({int noteNumber = 0, Color keyColor = Colors.white}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            final player = AudioCache();
            player.play('note$noteNumber.wav');
          });
        },
        child: Container(
          color: keyColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              noteKey(noteNumber: 1, keyColor: Colors.red),
              noteKey(noteNumber: 2, keyColor: Colors.orange),
              noteKey(noteNumber: 3, keyColor: Colors.yellow),
              noteKey(noteNumber: 4, keyColor: Colors.green),
              noteKey(noteNumber: 5, keyColor: Colors.cyan),
              noteKey(noteNumber: 6, keyColor: Colors.blue),
              noteKey(noteNumber: 7, keyColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
