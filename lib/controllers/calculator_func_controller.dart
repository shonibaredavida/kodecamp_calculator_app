import 'dart:math';

import 'package:get/get.dart';

class LoanCalculatorController extends GetxController {
  var loanAmt = 0.obs;
  var rate = 0.01.obs;
  var period = 1.obs;
  double _monthlyPayment = 0;

  get monthlyPayment => _monthlyPayment;

  void getMonthlyAmount() {
    _monthlyPayment = (rate.value * loanAmt.value) /
        (1 - pow((1 + rate.value), (-period.value)));
  }
}

class BMICalculator extends GetxController {
  var weight = 0.obs;
  var height = 0.obs;
  double _bmi = 0;
  get bmi => _bmi;
  void getBmi() {
    _bmi = weight.value / height.value;
  }
}

class CelsiusToFahrenheitCalculator extends GetxController {
  var celsiusValue = 0.obs;

  double _fahrenheit = 0;
  get fahrenheit => _fahrenheit;
  void getBmi() {
    _fahrenheit = ((9 / 5) * celsiusValue.value) + 32;
  }
}
