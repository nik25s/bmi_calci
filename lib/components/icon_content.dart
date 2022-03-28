import 'package:bmi_calci/screens/bmi_input.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calci/components/reusable_card.dart';
import 'package:bmi_calci/constant_component.dart';

class Iconcontent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  Iconcontent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label!,
          style: klabelstyle,
        ),
      ],
    );
  }
}
