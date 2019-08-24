import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'iconContent.dart';
import 'style_constants.dart';
import 'roundIconButton.dart';
import 'results_page.dart';
import 'nav_button.dart';
import 'calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 60;
  int age = 18;
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
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: CardContent(
                          cardText: "MALE", cardIcon: FontAwesomeIcons.male),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: CardContent(
                          cardText: "FEMALE",
                          cardIcon: FontAwesomeIcons.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: kLabelTextStyle,
                      ),
                      Expanded(
                        child: Column(

                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  " cm",
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                inactiveTrackColor: kSliderInactiveColor,
                                activeTrackColor: Colors.white,
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 100,
                                max: 200,
                                onChanged: (newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight -= 1;
                                  });
                                },
                                iconData: Icons.remove,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight += 1;
                                  });
                                },
                                iconData: Icons.add,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            this.age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                iconData: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    this.age -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                iconData: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    this.age += 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NavButton(
              buttonTitle: "CALCULATE",
              onTap: (){
                CalculatorBrain brain = CalculatorBrain(height: height, weight: weight, age: age);
                brain.calculateBMI();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Results(bmi: brain.getBMIString(), bmiInterpretation: brain.getInterpretation(), bmiResult: brain.getResult(),)));
                },
            ),
          ],
        ));
  }
}
