import 'package:flutter/material.dart';
import 'package:kodecamp_calculator_app/utils/constants/images.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          children: [
            Image.asset(
              AppImages.logo,
              height: 50,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems * 0.6,
            ),
            const Text(
              "KCalc",
              style: TextStyle(
                  fontSize: AppSizes.fontSizeLg * 1.5,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSectionsMd,
        ),
      ],
    );
  }
}
