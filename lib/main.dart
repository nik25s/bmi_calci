import 'package:bmi_calci/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calci/screens/bmi_input.dart';
import 'constant_component.dart';
import 'package:bmi_calci/screens/calculation_page.dart';
import 'caculator_brain.dart';

void main() {
  runApp(bmi());
}

class bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bmi_input(),
      theme: ThemeData.dark().copyWith(
        // primaryColor: Color(0xFF0A0E21), this is not working don't no y
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xFF0A0E21),
          // we can add text color default by texttheme
          // we can change theme for particular or for single widget also
        ),
      ),
    );
  }
}
