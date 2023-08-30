import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        leading: const Text('FLUTTER'),
        title: const Text('First App Challenge'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.amber,
      body: const Center(
        child: Image(image: NetworkImage('https://i.pinimg.com/474x/da/9a/52/da9a528ebe7598be61cd8aa69e1d6ec7.jpg'),),
      ),
    ),
  ));
}
