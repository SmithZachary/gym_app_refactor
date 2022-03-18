import 'dart:math';

import 'package:flutter/material.dart';

Color randoColors({required List<Color> colors}) {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];
  final _random = Random();
  return colors[_random.nextInt(colors.length)];
}
