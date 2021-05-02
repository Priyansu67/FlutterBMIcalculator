import 'package:bmi_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButtons extends StatelessWidget {
  RoundedIconButtons({this.text, this.label, this.onPlus, this.onMinus});
  final String? text;
  final String? label;
  final VoidCallback? onPlus;
  final VoidCallback? onMinus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$label', style: kLabelStyle),
        Text('$text', style: kNumberStyle),
        Row(
          children: [
            Expanded(
              child: RawMaterialButton(
                elevation: 16.0,
                constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
                shape: CircleBorder(),
                fillColor: kActiveCardColor,
                onPressed: onMinus,
                child: Icon(
                  FontAwesomeIcons.minus,
                  color: kBottomContainerColor,
                ),
              ),
            ),
            Expanded(
              child: RawMaterialButton(
                elevation: 16.0,
                constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
                shape: CircleBorder(),
                fillColor: kActiveCardColor,
                onPressed: onPlus,
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: kBottomContainerColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
