import 'package:bmi_flutter/constants.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback? onClicked;
  final String? label;
  const BottomBar({this.label, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        child: Center(
            child: Text(
          label.toString(),
          style: kTitleStyle,
        ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
      ),
    );
  }
}
