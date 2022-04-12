import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  CardIcon({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18.0),
        )
      ],
    );
  }
}
