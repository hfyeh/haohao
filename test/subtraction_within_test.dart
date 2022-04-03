import 'package:test/test.dart';
import 'package:haohao/subtraction_within.dart';

void main() {
  group('Subtraction', () {
    test('Should be less than or equal to 10', () {
      final subtraction = SubtractionWithin(10);
      expect(subtraction.result, lessThanOrEqualTo(10));
    });

    test('Should pass answer check', () {
      final subtraction = SubtractionWithin(10);
      subtraction.generateNumbers();
      expect(subtraction.isAnswerCorrect(answer: subtraction.result),
          equals(true));
    });
  });
}
