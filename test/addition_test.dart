import 'package:test/test.dart';
import 'package:haohao/addition.dart';

void main() {
  group('Addition', () {
    test('Should be less than or equal to 10', () {
      final addition = Addition(within: 10);
      expect(addition.result, lessThanOrEqualTo(10));
    });

    test('Should pass answer check', () {
      final addition = Addition(within: 10);
      addition.generateNumbers();
      expect(addition.isCorrect(answer: addition.result), equals(true));
    });
  });
}
