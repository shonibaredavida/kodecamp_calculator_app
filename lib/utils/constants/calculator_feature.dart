import 'package:kodecamp_calculator_app/model/calculator_function_model.dart';
import 'package:kodecamp_calculator_app/utils/constants/images.dart';

List calculatorFeature = <CalculatorFunction>[
  CalculatorFunction(
    name: "Loan Calculator",
    pix: AppImages.loan,
  ),
  CalculatorFunction(name: "BMI Calculator", pix: AppImages.bmi),
  CalculatorFunction(
      name: "Celsuis to Fah Calculator",
      shortName: "ºC->ºF Calculator",
      pix: AppImages.celToFah),
];
