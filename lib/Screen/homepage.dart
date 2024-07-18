import 'package:flutter/material.dart';
import 'package:kodecamp_calculator_app/utils/constants/calculator_feature.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/widgets/home_card_widget.dart';

class HompageScreen extends StatelessWidget {
  const HompageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CalculatorFeatureController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "KCalc",
              style: TextStyle(fontSize: AppSizes.fontSizeLg),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsLg,
            ),
            const Text(
              "Popular Calculator",
              style: TextStyle(fontSize: AppSizes.fontSizeLg),
            ),
            calculatorFeature.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeCardWidget(
                          calcFunctionPix: calculatorFeature[index].pix,
                          calcFuntionTitle: calculatorFeature[index].name);
                    },
                  )
                : const Center(
                    child: Text(
                      "No Calculator Available",
                      style: TextStyle(fontSize: AppSizes.fontSizeMd),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
