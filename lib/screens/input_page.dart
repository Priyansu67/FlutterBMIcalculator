import 'package:bmi_flutter/components/bottom_bar.dart';
import 'package:bmi_flutter/constants.dart';
import 'package:bmi_flutter/components/icon_content.dart';
import 'package:bmi_flutter/screens/output_page.dart';
import 'package:bmi_flutter/components/reusable_card.dart';
import 'package:bmi_flutter/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_flutter/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 30.0),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 17),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28),
                          thumbColor: kBottomContainerColor,
                          overlayColor: Colors.amber.withOpacity(0.16)),
                      child: Slider(
                        onChanged: (double kHeight) {
                          setState(() {
                            height = kHeight.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: RoundedIconButtons(
                      onPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      label: 'WEIGHT',
                      text: weight.toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: RoundedIconButtons(
                      onPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                      onMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      label: 'AGE',
                      text: age.toString(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomBar(
              label: 'CALCULATE',
              onClicked: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OutputPage(
                    bimResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    suggestion: calc.getSuggestion(),
                  );
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
