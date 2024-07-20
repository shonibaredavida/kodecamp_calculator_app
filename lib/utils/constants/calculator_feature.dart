import 'package:kodecamp_calculator_app/Screen/bmi_calculator_screen.dart';
import 'package:kodecamp_calculator_app/Screen/c_to_f_calculator_screen.dart';
import 'package:kodecamp_calculator_app/Screen/fd_calculator_screen.dart';
import 'package:kodecamp_calculator_app/Screen/loan_calculator_screen.dart';
import 'package:kodecamp_calculator_app/Screen/soon_to_come_screen.dart';
import 'package:kodecamp_calculator_app/model/calculator_function_model.dart';
import 'package:kodecamp_calculator_app/utils/constants/images.dart';

List<CalculatorFunction> calculatorFeature = <CalculatorFunction>[
  CalculatorFunction(
    name: "Loan",
    pix: AppImages.loan1,
    functionPage: const LoanCalculatorScreen(),
  ),
  CalculatorFunction(
    name: "BMI",
    pix: AppImages.bmi,
    functionPage: const BMICalculatorScreen(),
  ),
  CalculatorFunction(
    name: "Celsuis to Fahreheit",
    shortName: "ºC -> ºF",
    pix: AppImages.celToFah,
    functionPage: const CelFahCalculatorScreen(),
  ),
  CalculatorFunction(
      name: "Fixed Deposit",
      shortName: "F.D",
      pix: AppImages.fixedDepo,
      functionPage: const FDCalculatorScreen()),
  CalculatorFunction(
      name: "SIP",
      pix: AppImages.sip,
      functionPage: const SoonToCome(
        index: 4,
      )),
  CalculatorFunction(
      name: "EMI",
      pix: AppImages.emi,
      functionPage: const SoonToCome(
        index: 5,
      )),
  CalculatorFunction(
      name: "Lumpsum",
      pix: AppImages.lumpsum,
      functionPage: const SoonToCome(
        index: 6,
      )),
  CalculatorFunction(
      name: "Income Tax",
      pix: AppImages.tax,
      functionPage: const SoonToCome(
        index: 7,
      )),
  CalculatorFunction(
      name: "PPF",
      pix: AppImages.ppf,
      functionPage: const SoonToCome(
        index: 8,
      )),
  CalculatorFunction(
      name: "GST",
      pix: AppImages.gst,
      functionPage: const SoonToCome(
        index: 9,
      )),
  CalculatorFunction(
      name: "Mutual Funds Returns",
      shortName: "Mutual Funds",
      pix: AppImages.mutual,
      functionPage: const SoonToCome(
        index: 10,
      )),
  CalculatorFunction(
      name: "Sukanya Samariddhi Yojana",
      shortName: "Sukanya \nSamariddhi",
      pix: AppImages.suka,
      functionPage: const SoonToCome(
        index: 11,
      )),
];

/* List<Widget> routeList = <Widget>[
  const LoanCalculatorScreen(),
  const BMICalculatorScreen(),
  const CelFahCalculatorScreen(),
  const FDCalculatorScreen(),
  NotAvailable(),
  NotAvailable(),
]; */


