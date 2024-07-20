import 'dart:math';

import 'package:get/get.dart';

class FDCalculatorController extends GetxController {
  final _amtInvested = 100000.0.obs;
  final _rate = 6.5.obs;
  final _period = 5.obs;
  final _estReturn = 0.0.obs;
  String get amtInvested => (_amtInvested.value.round()).toString();
  String get rate => _rate.value.toStringAsFixed(1);
  String get period => (_period.value.round()).toString();
  String get estReturn {
    if (_rate.value <= 0.5) {
      _estReturn.value = 0;
    }
    return (_estReturn.value.round()).toString();
  }

  String get totalAmount =>
      (_estReturn.round() + _amtInvested.value.round()).toString();
  void updateAmtInvested(value) {
    _amtInvested.value = value;
  }

  void updatePeriod(value) {
    _period.value = value.round();
  }

  void updateRate(value) {
    _rate.value = value;
  }

  getEstReturn() {
    if (_rate.value == 0) {
      _estReturn.value = 0;
    } else {
      // double periodInMonths = _period.value * 12;
      /*  _estReturn.value = (rate.value * amtInvested.value) /
        (1 - pow((1 + (rate.value / 12)), (-(installments))));
P + P {(1 + i/100) t – 1}
 */
      // double monthlyRate = _rate.value / 1200;
      _estReturn.value = calculateFDCompoundInterest(
              _amtInvested.value, _rate.value, _period.value) -
          _amtInvested.value;
    }
    _estReturn.refresh();
  }
}

double calculateFDCompoundInterest(
    double principal, double interestRate, int years) {
  // Convert interest rate to decimal
  double interestInDecimal = interestRate / 100;

  // Calculate maturity amount using compound interest formula
  double maturityAmount = principal * pow(1 + interestInDecimal, years);

  return maturityAmount;
}

class LoanCalculatorController extends GetxController {
  final _loanAmt = 10.0.obs;
  final _rate = 1.0.obs;
  final _period = 1.obs;
  final _monthlyPayment = 0.0.obs;
  String get loanAmt => (_loanAmt.value.round()).toString();
  String get rate => (_rate.value.round()).toString();
  String get period => (_period.value.round()).toString();
  String get monthlyPayment {
    if (_rate.value <= 0.5) {
      _monthlyPayment.value = 0;
    }
    return (_monthlyPayment.value.round()).toString();
  }

  String get totalInterest => getTotalInterest().toString();
  String get totalAmount =>
      (getTotalInterest() + _loanAmt.value.round()).toString();
  void updateAmt(value) {
    _loanAmt.value = value;
  }

  void updatePeriod(value) {
    _period.value = value.round();
  }

  void updateRate(value) {
    _rate.value = value;
  }

  getMonthlyAmount() {
    if (_rate.value == 0) {
      _monthlyPayment.value = 0;
    } else {
      double periodInMonths = _period.value * 12;
      /*  _monthlyPayment.value = (rate.value * loanAmt.value) /
        (1 - pow((1 + (rate.value / 12)), (-(installments))));
 */
      double monthlyRate = _rate.value / 1200;
      _monthlyPayment.value = _loanAmt *
          monthlyRate *
          pow(1 + monthlyRate, periodInMonths) /
          (pow(1 + monthlyRate, periodInMonths) - 1);
    }
    getTotalInterest();
    _monthlyPayment.refresh();
  }

  int getTotalInterest() {
    double totalInterest;
    if (_rate.value < 0.5) {
      totalInterest = 0;
    } else {
      totalInterest = (_monthlyPayment * _period.value * 12) - _loanAmt.value;
    }
    return totalInterest.round();
  }
}

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
