import 'package:get/get.dart';

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
        //  Get.off(const LandingPageScreen());
      },
    );
  }
}
