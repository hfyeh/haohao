import 'package:test/test.dart';
import 'package:haohao/addition.dart';

void main() {
  group('Addition', () {
    test('Should should less than or equal to 10', () {
      final addition = Addition();
      expect(addition.result, lessThanOrEqualTo(10));
    });
  });
}
