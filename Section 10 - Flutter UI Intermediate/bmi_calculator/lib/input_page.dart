import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IconContent(
                      color: activeCardColor,
                      cardChild: CardIcon(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconContent(
                      color: activeCardColor,
                      cardChild: CardIcon(
                        icon: FontAwesomeIcons.venus,
                        text: 'MALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconContent(color: activeCardColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IconContent(color: activeCardColor),
                  ),
                  Expanded(
                    child: IconContent(color: activeCardColor),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
