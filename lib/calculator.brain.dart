import 'dart:math';


class CalculatorBrain {
   CalculatorBrain({this.height, this.weight});
   final int height;
   final int weight;

   double _bmi;

   String calculateBMI(){
     _bmi = weight / pow(height / 100, 2);
     return _bmi.toStringAsFixed(1);
   }
   String getResult() {
     if (_bmi >= 25){
     return 'Overweight';
     } else if (_bmi > 18.5) {
       return 'Normal';
     } else {
       return 'Underweight';
     }
   }
   String getInterpertation(){
     if (_bmi >= 25){
       return 'you have a higher than a normal body weight . Try to exercise as much as you can !!!';
     } else if (_bmi > 18.5) {
       return " Congratulation !!! you are Fit ";
     } else {
       return 'Eat more you need to gain weight';
     }
   }
}
