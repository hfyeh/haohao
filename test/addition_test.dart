import 'package:test/test.dart';
import 'package:haohao/addition_up_to.dart';

void main() {
  group('Addition', () {
    test('Should should less than or equal to 10', () {
      final addition = AdditionUpTo(10);
      expect(addition.result, lessThanOrEqualTo(10));
    });
  });
}
