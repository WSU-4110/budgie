import 'package:budgie/BudgetCircle/overallBudgetCircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/main.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';

void main() {
  group('Testing dynamicColor.', () {
    test('If progress >= 75%, return green', () {
      final color = dynamicColor('75', '100');

      expect(color, Colors.green);
    });

    test('If progress <= 50%, return yellow', () {
      final color = dynamicColor('50', '100');

      expect(color, Colors.yellow);
    });

    test('If progress <= 25%, return red', () {
      final color = dynamicColor('25', '100');

      expect(color, Colors.red);
    });
  });

  group('Testing colorChange.', () {
    test('If progress >= 75%, return green', () {
      final color = colorChange(1);

      expect(color, const Color.fromRGBO(34, 197, 94, 1));
    });

    test('If progress <= 50%, return yellow', () {
      final color = colorChange(.5);

      expect(color, const Color.fromRGBO(255, 217, 102, 1));
    });

    test('If progress <= 15%, return red', () {
      final color = colorChange(.15);

      expect(color, const Color.fromRGBO(225, 55, 43, 1));
    });
  });
}
