import 'package:bmi_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
          color: Colors.amber,
        ),
        Text('$label', style: kLabelStyle),
      ],
    );
  }
}
