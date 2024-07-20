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
