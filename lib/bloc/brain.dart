import 'dart:math';

class BmiBrain {
  static double height = 180;
  static int weight = 30;
  static double _bmi;

  BmiBrain() {
    print(height);
    print(weight);
  }

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return ('overWeight');
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweiht';
    }
  }

  String geInterpretation() {
    if (_bmi >= 25) {
      return ('you have a higher body weight try excercisng more');
    } else if (_bmi > 18.5) {
      return 'YOu have a Normal body weight ,Good Job';
    } else {
      return 'your weight is less than normal ,please Eat More and More';
    }
  }
}
