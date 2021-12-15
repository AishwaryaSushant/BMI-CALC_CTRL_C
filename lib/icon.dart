import 'package:flutter/material.dart';
import 'const.dart';

class Iconmaterial extends StatelessWidget {
  Iconmaterial({ @required this.icon ,this.label });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 80.0,
          color:Color(0xB3FFFFFF),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:labelTextStyle,
          ),


      ],
    );
  }
}