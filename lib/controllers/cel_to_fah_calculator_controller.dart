import 'package:get/get.dart';

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
