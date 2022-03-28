import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icone, this.onclick});
  final IconData? icone;
  final Function()? onclick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icone),
      onPressed: onclick,
      shape: CircleBorder(),
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5F),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
