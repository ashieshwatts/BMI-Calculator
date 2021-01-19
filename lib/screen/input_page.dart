import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = kInactiveColourString;
  Color femaleCardColour = kInactiveColourString;

  Gender selectedGender ;

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male ? kActiveColourString : kInactiveColourString,
                    childCard: IconContent(
                      changeIcon: FontAwesomeIcons.mars,
                      changeName: 'MALE',
                    ),
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    colour: selectedGender == Gender.Female ? kActiveColourString : kInactiveColourString,
                    childCard: IconContent(
                      changeIcon: FontAwesomeIcons.venus,
                      changeName: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kInactiveColourString,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kIconTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kIconTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colors.white60,
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x1fEB1555),
                  ),
                      child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ))
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: <Widget> [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveColourString,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                        style: kIconTextStyle,
                        ),

                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    colour: kInactiveColourString,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'AGE',
                          style: kIconTextStyle,
                        ),

                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),

                            SizedBox(
                              width: 15,
                            ),

                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }
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

          BottomButton(buttonTitle: 'CALCULATE', onTap: () {

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResults(),
              interpretation: calc.getInterpretation(),
            )));
          },)
        ],
      ),
    );
  }
}