import 'package:bmi_flutter/components/bottom_bar.dart';
import 'package:bmi_flutter/constants.dart';
import 'package:bmi_flutter/components/reusable_card.dart';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  final String bimResult;
  final String resultText;
  final String suggestion;

  const OutputPage({ required this.bimResult, required this.resultText, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'YOUR RESULT',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: kBottomContainerColor),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(bimResult, style: kBMIValueStyle),
                    Text(
                      suggestion,
                      style: kResultSuggestionStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: BottomBar(
                label: 'RECALCULATE',
                onClicked: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
