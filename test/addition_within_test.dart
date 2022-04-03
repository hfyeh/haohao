import 'package:test/test.dart';
import 'package:haohao/addition_within.dart';

void main() {
  group('Addition', () {
    test('Should should less than or equal to 10', () {
      final addition = AdditionWithin(10);
      expect(addition.result, lessThanOrEqualTo(10));
    });

    test('Should should less than or equal to 10', () {
      final addition = AdditionWithin(10);
      addition.generateNumbers();
      expect(addition.result, lessThanOrEqualTo(10));
    });
  });
}
