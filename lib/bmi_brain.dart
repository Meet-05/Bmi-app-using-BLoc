import 'dart:math';

import 'package:flutter/material.dart';

class BmiBrain {
  final int height;
  final int weight;
  double _bmi;

  BmiBrain({@required this.height, @required this.weight});

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
