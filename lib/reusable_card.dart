import 'package:flutter/material.dart';


class Reusablecard extends StatelessWidget {
  Reusablecard({@required this.colour, this.reusableChild , this.onPressed});

  final Color colour;
  final Widget reusableChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
    onTap: onPressed,
     child: Container(
        child: reusableChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}