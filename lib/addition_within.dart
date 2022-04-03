import 'dart:math';

class AdditionWithin {
  late int _num1;
  late int _num2;
  final int _maxSum;

  int get result => _num1 + _num2;

  AdditionWithin(this._maxSum) {
    generateNumbers();
  }

  void generateNumbers() {
    bool firstTime = true;
    while (firstTime || _num1 + _num2 > _maxSum) {
      _num1 = Random().nextInt(_maxSum);
      _num2 = Random().nextInt(_maxSum);
      firstTime = false;
    }
  }

  bool isAnswerCorrect({required int answer}) {
    return answer == _num1 + _num2;
  }

  String showQuestion() {
    return '$_num1 + $_num2 =';
  }
}
