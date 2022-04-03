import 'dart:math';

import 'package:haohao/quiz_item.dart';

class Addition implements QuizItem {
  late int _num1;
  late int _num2;
  final int _maxSum;

  int get result => _num1 + _num2;

  Addition({required within}) : _maxSum = within {
    generateNumbers();
  }

  @override
  void generateNumbers() {
    _num1 = Random().nextInt(_maxSum);
    _num2 = Random().nextInt(_maxSum - _num1);
  }

  @override
  bool isCorrect({required int answer}) {
    return answer == result;
  }

  @override
  String showQuestion() {
    return '$_num1 + $_num2 =';
  }
}
