import 'dart:math';

import 'package:haohao/quiz_item.dart';

class Subtraction implements QuizItem {
  late int _minuend;
  late int _subtrahend;
  final int _diffLimit;

  int get result => _minuend - _subtrahend;

  Subtraction({required int within}) : _diffLimit = within {
    generateNumbers();
  }

  @override
  void generateNumbers() {
    _minuend = Random().nextInt(_diffLimit);
    if (_minuend != 0) {
      _subtrahend = Random().nextInt(_minuend);
    } else {
      _subtrahend = 0;

    }
  }

  @override
  bool isCorrect({required int answer}) {
    return answer == result;
  }

  @override
  String showQuestion() {
    return '$_minuend - $_subtrahend =';
  }
}
