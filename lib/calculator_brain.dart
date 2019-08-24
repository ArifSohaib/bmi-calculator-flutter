import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height, this.weight, this.age});
  final int height;
  final int weight;
  final int age;
  double _bmi;

  double calculateBMI(){
    this._bmi = weight/pow(height/100, 2);
    return _bmi;
  }

  String getBMIString(){
    return _bmi.toStringAsFixed(2);
  }
  String getResult(){
    if (_bmi >= 25){
      return "OVERWEIGHT";
    }
    else if(_bmi >= 18){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation(){
    if (_bmi >= 25){
      return "You have higher than normal BMI, you should exercise more";
    }
    else if (_bmi >= 18){
      return "Your BMI is normal. Keep it up";
    }
    else{
      return "Your BMI is below normal. You should try to increase your muscle";
    }
  }
}