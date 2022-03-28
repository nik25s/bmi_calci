import 'package:bmi_calci/constant_component.dart';
import 'package:flutter/material.dart';
import 'bmi_input.dart';
import 'package:bmi_calci/components/reusable_card.dart';
import 'package:bmi_calci/components/bottom_button.dart';
import 'package:bmi_calci/caculator_brain.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class calculation extends StatelessWidget {
  calculation(
      {required this.interpretation,
      required this.bmiresult,
      required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('BMI CALCULATION'),
          ],
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiresult.toUpperCase(), style: kresultTextstyle),
                  Text(resulttext, style: kbmiNumberstyle),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          bottomButton(
              buttonTitle: 'RE-CALCULATE',
              ontap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
