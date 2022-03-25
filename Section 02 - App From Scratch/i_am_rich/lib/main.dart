import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am Rich'),
          backgroundColor: Colors.cyanAccent,
        ),
        backgroundColor: Colors.blueGrey,
        body: const Center(
          child: Image(
            image:
                NetworkImage('https://pbs.twimg.com/media/DU4dljEW4AAfcKj.jpg'),
          ),
        ),
      ),
    ),
  );
}
