import 'package:test/test.dart';
import 'package:haohao/math/arithmetic/subtraction.dart';

void main() {
  group('Subtraction', () {
    test('Should be less than or equal to 10', () {
      final subtraction = Subtraction(within: 10);
      expect(subtraction.result, lessThanOrEqualTo(10));
    });

    test('Should pass answer check', () {
      final subtraction = Subtraction(within: 10);
      subtraction.generateNumbers();
      expect(subtraction.isCorrect(answer: subtraction.result),
          equals(true));
    });
  });
}
