import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/controllers/splash_screen_controller.dart';
import 'package:kodecamp_calculator_app/utils/constants/images.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/utils/constants/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashImage,
              height: 200,
            ),
            const Text(
              appName,
              style: TextStyle(
                  fontSize: 2 * AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsSm,
            )
          ],
        ),
      ),
    );
  }
}
