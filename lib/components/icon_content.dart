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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Icon(
            icon,
            size: 60.0,
            color: Colors.amber,
          ),
        ),
        Expanded(child: Text('$label', style: kLabelStyle)),
      ],
    );
  }
}
