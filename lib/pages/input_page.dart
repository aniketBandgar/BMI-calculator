import 'file:///C:/Users/DELL/AndroidStudioProjects/bmi-calculator-flutter/lib/pages/resultPage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import '../components/reusable_clas.dart';
import '../components/content.dart';
import '../components/constant.dart';
import '../button/RoundIconButton.dart';
import '../button/bottomButton.dart';
import 'package:bmi_calculator/components/brain.dart';

enum MaleOrFemale {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  MaleOrFemale selectGender;

  int userHeight = 180;
  int userWeight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = MaleOrFemale.male;
                      });
                    },
                    colour: selectGender == MaleOrFemale.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: Content(
                      iconOnCard: FlutterIcons.mars_faw5s,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = MaleOrFemale.female;
                      });
                    },
                    colour: selectGender == MaleOrFemale.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: Content(
                      iconOnCard: FlutterIcons.venus_faw5s,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        userHeight.toString(),
                        style: kNumTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // SliderTheme(
                  //   data:
                  //   ),
                  // child:
                  Slider(
                    value: userHeight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        userHeight = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FlutterIcons.minus_ant,
                              state: () {
                                setState(() {
                                  userWeight = userWeight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FlutterIcons.plus_ant,
                                state: () {
                                  setState(() {
                                    userWeight = userWeight + 1;
                                  });
                                }),
                          ],
                        ),
                        // FloatingActionButton()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FlutterIcons.minus_ant,
                              state: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FlutterIcons.plus_ant,
                              state: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BmiBrain calc = BmiBrain(height: userHeight, weight: userWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmiResult: calc.getBmi(),
                      bmiState: calc.getBmiResult(),
                      bmiLast: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            label: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
