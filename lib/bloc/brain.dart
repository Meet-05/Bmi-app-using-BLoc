import 'dart:math';
import 'dart:async';
import 'package:flutter/widgets.dart';

class BmiBrain {
  static int height = 180;
  static int weight = 30;
  static double _bmi;

  static final _bmiStreamController = StreamController<String>();
  static StreamSink<String> get bmiSink => _bmiStreamController.sink;
  static Stream<String> get bmiStream => _bmiStreamController.stream;

  final _weightStreamController = StreamController<int>();
  StreamSink<int> get weightSink => _weightStreamController.sink;
  Stream<int> get weightStream => _weightStreamController.stream;

  final _heightStreamController = StreamController<int>();
  StreamSink<int> get heightSink => _heightStreamController.sink;
  Stream<int> get heightStream => _heightStreamController.stream;

  static final _resultStreamController = StreamController<String>();
  static StreamSink<String> get resultSink => _resultStreamController.sink;
  static Stream<String> get resultStream => _resultStreamController.stream;

  BmiBrain() {
    heightStream.listen((event) {
      print('$event');
      height = event;
    });
    weightStream.listen((event) {
      print('$event');
      weight = event;
    });
    bmiSink.add(calculateBmi());
    resultSink.add(getResult());
  }

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
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
