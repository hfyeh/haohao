import 'dart:math';

class Addition {
  late int _num1;
  late int _num2;

  Addition() {
    generateNumbers(sumMax: 10);
  }

  void generateNumbers({required int sumMax}) {
    bool firstTime = true;
    while (firstTime || _num1 + _num2 > sumMax) {
      _num1 = Random().nextInt(sumMax);
      _num2 = Random().nextInt(sumMax);
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
