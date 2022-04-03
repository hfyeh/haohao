import 'dart:math';

class Addition {
  late int _num1;
  late int _num2;
  final int _sumLimit;

  int get result => _num1 + _num2;

  Addition(this._sumLimit) {
    generateNumbers();
  }

  void generateNumbers() {
    bool firstTime = true;
    while (firstTime || _num1 + _num2 > _sumLimit) {
      _num1 = Random().nextInt(_sumLimit);
      _num2 = Random().nextInt(_sumLimit);
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
