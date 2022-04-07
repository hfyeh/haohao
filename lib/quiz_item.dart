import 'math/arithmetic/addition.dart';
import 'math/arithmetic/subtraction.dart';

enum QuizCategory {
  addition,
  subtraction,
}

abstract class QuizItem {
  factory QuizItem(QuizCategory arithOp) {
    switch (arithOp) {
      case QuizCategory.addition:
        return Addition(within: 10);
      case QuizCategory.subtraction:
        return Subtraction(within: 10);
      default:
        return Addition(within: 10);
    }
  }

  void generateNumbers();

  String showQuestion();

  bool isCorrect({required int answer});
}
