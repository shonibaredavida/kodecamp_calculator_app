import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/utils/constants/calculator_feature.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

class SoonToCome extends StatelessWidget {
  const SoonToCome({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final name = calculatorFeature[index].name;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "KCalc",
                style: TextStyle(fontSize: AppSizes.fontSizeLg),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSectionsSm,
              ),
              Text(
                "$name Calculator",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: AppSizes.fontSizeLg * 1.1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Calculator is Currently Unavailable",
                      style: TextStyle(fontSize: AppSizes.fontSizeLg),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Go Back",
                            style: TextStyle(fontSize: AppSizes.fontSizeLg)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
