import 'dart:math';

import 'package:get/get.dart';

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
