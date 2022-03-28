import 'package:bmi_calci/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calci/constant_component.dart';

// so this is our self made widget
class ReusableCard extends StatelessWidget {
  // cutom constructor so we can give diff color,child to each card if we want
  ReusableCard({this.colour, this.cardchild, this.onpress});
  final Color? colour;
  final Widget? cardchild;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
