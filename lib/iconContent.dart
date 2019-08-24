import 'package:flutter/material.dart';
import 'style_constants.dart';

class CardContent extends StatefulWidget {
  final String cardText;
  final IconData cardIcon;
  CardContent({@required this.cardText, @required this.cardIcon});
  @override
  _CardContentState createState() => _CardContentState(cardText: this.cardText, cardIcon: this.cardIcon);
}

class _CardContentState extends State<CardContent> {
  _CardContentState({@required this.cardText, @required this.cardIcon});
  final String cardText;
  final IconData cardIcon;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(this.cardIcon,size: 80,color: Color(0xFF8D8E98),),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.cardText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}