import 'dart:math';

import 'package:get/get.dart';

class BMICalculatorController extends GetxController {
  final _weight = 10.0.obs;
  final _height = 32.0.obs;
  final _bmi = 0.0.obs;
  get bmi => _bmi.value.toStringAsFixed(2);
  get height => _height.value.round().toString();
  get heightString => (_height.value / 100).toStringAsFixed(2);
  get weight => _weight.value.toStringAsFixed(2);
  void updateWeight(newValue) {
    _weight.value = newValue;
  }

  void updateHeight(newValue) {
    _height.value = newValue;
  }

  void getBmi() {
    double heightInMeters = _height.value / 100;
    _bmi.value = _weight.value / (heightInMeters * heightInMeters);
    _bmi.refresh();
  }
}

class CelsiusToFahrenheitController extends GetxController {
  final _celsiusValue = 0.0.obs;

  final _fahrenheit = 0.0.obs;
  get celsiusValue => _celsiusValue.value.toStringAsFixed(1);

  get fahrenheit => _fahrenheit.toStringAsFixed(1);
  void updateCelc(newValue) {
    _celsiusValue.value = newValue;
  }

  void getFahValue() {
    _fahrenheit.value = ((9 / 5) * _celsiusValue.value) + 32;
    _fahrenheit.refresh();
  }
}
