import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  IconContent({@required this.color, this.cardChild}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
