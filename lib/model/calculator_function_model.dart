import 'package:flutter/material.dart';

class CalculatorFunction {
  final String name;
  final String pix;
  final String? shortName;
  final Widget functionPage;

  CalculatorFunction({
    required this.name,
    required this.pix,
    this.shortName,
    required this.functionPage,
  });
}
