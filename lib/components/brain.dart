import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiBrain {
  BmiBrain({@required this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight.Try to exercise more';
    } else if (_bmi > 18) {
      return 'You have normal body weight ,Good job';
    } else {
      return 'You have lower than normal body weight,You can eat little bit more';
    }
  }
}
