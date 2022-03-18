import 'dart:math';

import 'package:bar_gym_app/app/utils/_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Random Color', () {
    test('Pick random color', () {
      final List<Color> colors = <Color>[
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.orange
      ];
      expect(
        randoColors(colors: [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.orange
        ]),
        colors[Random().nextInt(colors.length)],
      );
    });
  });
}
