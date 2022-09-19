import 'package:flutter_test/flutter_test.dart';

import 'challente2.dart';

void main() {
  group('Test Challenge 1', () {
    late Challenge2 challenge2;

    setUp(() {
      challenge2 = Challenge2();
    });

    test('Test Case 1', () {
      int value = challenge2.diceFacesCalculator(6, 6, 6);
      expect(value, equals(18));
    });

    test('Test Case 2', () {
      int value = challenge2.diceFacesCalculator(5, 5, 5);
      expect(value, equals(15));
    });

    test('Test Case 3', () {
      int value = challenge2.diceFacesCalculator(1, 2, 3);
      expect(value, equals(3));
    });

    test('Test Case 4', () {
      int value = challenge2.diceFacesCalculator(1, 2, 1);
      expect(value, equals(2));
    });

    test('Test Case 5', () {
      int value = challenge2.diceFacesCalculator(3, 6, 3);
      expect(value, equals(6));
    });

    test('Test Case 6', () {
      int value = challenge2.diceFacesCalculator(6, 5, 4);
      expect(value, equals(6));
    });

    test('Test Case 7', () {
      int value = challenge2.diceFacesCalculator(4, 5, 6);
      expect(value, equals(6));
    });

    test('Test Case 8', () {
      int value = challenge2.diceFacesCalculator(7, 6, 5);
      expect(value, equals(7));
    });

    test('Test Case 9', () {
      expect(() => challenge2.diceFacesCalculator(0, 6, 5),
          throwsA(isA<Exception>()));
    });

    test('Test Case 10', () {
      expect(
        () => challenge2.diceFacesCalculator(-1, 2, 3),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
