import 'package:flutter_test/flutter_test.dart';
import 'package:projeto22/domain/services/perfect_number_service.dart';

void main() {
  late PerfectNumberService service;

  setUp(() {
    service = PerfectNumberService();
  });

  group('PerfectNumberService.isPerfect', () {
    test('returns false for numbers <= 1', () {
      expect(service.isPerfect(0), isFalse);
      expect(service.isPerfect(1), isFalse);
      expect(service.isPerfect(-5), isFalse);
    });

    test('returns true for the first four perfect numbers', () {
      expect(service.isPerfect(6), isTrue);
      expect(service.isPerfect(28), isTrue);
      expect(service.isPerfect(496), isTrue);
      expect(service.isPerfect(8128), isTrue);
    });

    test('returns false for non-perfect numbers', () {
      expect(service.isPerfect(2), isFalse);
      expect(service.isPerfect(10), isFalse);
      expect(service.isPerfect(12), isFalse);
      expect(service.isPerfect(100), isFalse);
    });
  });

  group('PerfectNumberService.findInRange', () {
    test('returns empty list when start > end', () {
      expect(service.findInRange(10, 1), isEmpty);
    });

    test('returns empty list when range contains no perfect numbers', () {
      expect(service.findInRange(7, 27), isEmpty);
    });

    test('finds 6 and 28 in range 1..100', () {
      expect(service.findInRange(1, 100), equals([6, 28]));
    });

    test('finds all four known perfect numbers in range 1..10000', () {
      expect(service.findInRange(1, 10000), equals([6, 28, 496, 8128]));
    });

    test(
      'returns single-element list when start == end and number is perfect',
      () {
        expect(service.findInRange(6, 6), equals([6]));
      },
    );

    test('returns empty list when start == end and number is not perfect', () {
      expect(service.findInRange(5, 5), isEmpty);
    });
  });
}
