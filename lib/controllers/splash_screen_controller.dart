import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/Screen/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateToGame();
    super.onInit();
  }

  void navigateToGame() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(const HompageScreen());
      },
    );
  }
}
