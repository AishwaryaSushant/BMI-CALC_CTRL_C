import 'package:bmi_calculator/const.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';


class Result extends StatelessWidget {

  Result({@required this.interpretation, @required this.bmi, @required this.resulttext});

  final String bmi;
  final String resulttext;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(child: Container(
            child: Text("Your Results", style: kTitleTextStyle ,
            ),
          ),
          ),
          Expanded(flex: 5,
          child:  Reusablecard(
            colour: activeCardColour,
            reusableChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resulttext.toUpperCase(),
                  style: ResultTextStyle,
                ),
                Text(bmi,
                  style: Bmitextstyle,
                ),
                Text(interpretation,
                textAlign: TextAlign.center,
                style:Bodytextstyle,
                )

              ],
            ),
          ),
          )

        ],
      ),
    );
  }
}
