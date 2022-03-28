import 'package:flutter/material.dart';
import 'package:bmi_calci/constant_component.dart';

class bottomButton extends StatelessWidget {
  final Function()? ontap;
  final String? buttonTitle;
  bottomButton({this.buttonTitle, this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomheight,
        child: Center(
          child: Text(
            buttonTitle!,
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
      ),
    );
  }
}
