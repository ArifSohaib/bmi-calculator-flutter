import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'iconContent.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final activeCardColor = Color(0xFF1D1E33);
  final inactiveCardColor = Color(0xFFEB1555);
  final bottomContainerHeight = 80.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ReusableCard(
                    colour: activeCardColor,
                    child: CardContent(cardText: "MALE", cardIcon: Icon(FontAwesomeIcons.mars, size: 80.0,color:  Color(0xFF8D8E98),))
                  ),
                  ReusableCard(colour: inactiveCardColor, child: CardContent(cardText: "FEMALE", cardIcon: Icon(FontAwesomeIcons.venus, size: 80.0,color:  Color(0xFF8D8E98),)),),
                ],
              ),
            ),
            ReusableCard(
              colour: Color(0xFF1D1E33),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  ReusableCard(
                    colour: Colors.orange,
                  ),
                  ReusableCard(
                    colour: Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
