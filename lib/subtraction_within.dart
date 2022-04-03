import 'dart:math';

import 'package:haohao/quiz_item.dart';

class SubtractionWithin implements QuizItem {
  late int _minuend;
  late int _subtrahend;
  final int _diffLimit;

  int get result => _minuend - _subtrahend;

  SubtractionWithin(this._diffLimit) {
    generateNumbers();
  }

  void generateNumbers() {
    bool firstTime = true;
    while (firstTime || _exceedsLimit()) {
      _minuend = Random().nextInt(_diffLimit);
      _subtrahend = Random().nextInt(_minuend);
      firstTime = false;
    }
  }

  bool _exceedsLimit() {
    return result > _diffLimit;
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
