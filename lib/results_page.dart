import 'package:flutter/material.dart';
import 'style_constants.dart';
import 'reusableCard.dart';
import 'nav_button.dart';

class Results extends StatelessWidget {
  final String bmiResult;
  final String bmiInterpretation;
  final String bmi;
  Results({@required this.bmi, @required this.bmiResult, @required this.bmiInterpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  "Your Results Are:",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(bmiResult, style: kResultsTextStyle,),
                    Text(bmi, style: kBMITextStyle,),
                    Text(bmiInterpretation, style: kBodyTextStyle,),
                  ],
                ),
              ),
            ),
            NavButton(
              onTap: ()=>Navigator.pop(context),
              buttonTitle: "RE-CALCULATE",
            )
          ],
        ));
  }
}
