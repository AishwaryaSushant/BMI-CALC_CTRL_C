import 'dart:math';
import 'package:bmi_calculator/calculator.brain.dart';

import 'result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'reusable_card.dart';
import 'const.dart';
import 'calculator.brain.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 45;
  int age= 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardcolor,
                    reusableChild: Iconmaterial(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardcolor,
                    reusableChild: Iconmaterial(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              colour: activeCardColour,
              reusableChild: Column(children: <Widget>[
                Text(
                  "HEIGHT",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: labelTextsecond,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    inactiveTrackColor: Colors.blueAccent,
                    activeTrackColor: Colors.green,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(
                          () => height = newValue.toInt(),
                        );
                        print(newValue);
                      }),
                )
              ]),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: Reusablecard(
                  colour: activeCardColour,
                  reusableChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: labelTextsecond,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: Icons.add,
                            fuctionality: () {
                              setState(() {
                                weight++;
                                min(0, 100);
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: Icons.remove,
                            fuctionality: () {
                              setState(() {
                                weight<=0? weight=0 : weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reusablecard(
                  colour: activeCardColour,
                  reusableChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: labelTextsecond,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: Icons.add,
                            fuctionality: () {
                              setState(() {
                              age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: Icons.remove,
                            fuctionality: () {
                              setState(() {
                                 age<=0? age=0 : age--;
                               //if  age== positive;
                               //age--;
                                //else;
                               // age==0;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ]),
          ),

          GestureDetector(
            onTap: () {
              CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(bmi: calc.calculateBMI(),
                      resulttext: calc.getResult(),
                      interpretation: calc.getInterpertation(),

                    );
                  },
                ),
              );
            },
            child: Container(
              child:Center(
                  child: Text('CALCULATE' , style: kLargeButtonTextStyle)
              ),
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
   final this.icon,
    final  this.fuctionality,
  });

  final IconData icon;
  Function fuctionality;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: fuctionality,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
