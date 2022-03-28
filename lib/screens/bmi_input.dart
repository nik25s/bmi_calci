import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calci/components/reusable_card.dart';
import 'package:bmi_calci/components/icon_content.dart';
import 'package:bmi_calci/constant_component.dart';
import 'package:bmi_calci/screens/calculation_page.dart';
import 'package:bmi_calci/components/bottom_button.dart';
import 'package:bmi_calci/components/round_icon_btn.dart';
import 'package:bmi_calci/caculator_brain.dart';

enum Gender {
  male,
  female,
}

class bmi_input extends StatefulWidget {
  @override
  _bmi_inputState createState() => _bmi_inputState();
}

class _bmi_inputState extends State<bmi_input> {
  Gender? selectGender;
  int height = 180;
  int weight = 74;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  // ReusableCard() is actually our selfmade widget which contain a container in which ther is color,margin,height,width and boxdecoration which is present in last of this page, we made this widget bcz it repeat same 4 time so we created once and used in other too so our code will remain neat and follow DRY principle
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colour: selectGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardchild: Iconcontent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colour: selectGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardchild: Iconcontent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInActiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: klabelstyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: knumberstyle),
                      Text('cm', style: klabelstyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icone: FontAwesomeIcons.minus,
                                onclick: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icone: FontAwesomeIcons.plus,
                                onclick: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: klabelstyle),
                        Text(age.toString(), style: knumberstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icone: FontAwesomeIcons.minus,
                                onclick: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icone: FontAwesomeIcons.plus,
                                onclick: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomButton(
              buttonTitle: 'CALCULATE',
              ontap: () {
                CalculatorBrain cb =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => calculation(
                      interpretation: cb.getinterpertation(),
                      bmiresult: cb.getresult(),
                      resulttext: cb.calculateBMI(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}


// pop up button example
/*
      floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.amber),
        child: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayColor: Color(0xFF0A0E21),
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.mail,
                  color: Colors.deepOrange,
                ),
                label: 'Mail',
                labelStyle: TextStyle(color: Colors.brown),
                onTap: () => print('sent mail')),
            SpeedDialChild(
              child: Icon(
                Icons.copy,
                color: Colors.deepOrange,
              ),
              label: 'Copy',
              labelStyle: TextStyle(color: Colors.brown),
            ),
          ],
        ),
      ),
      */
