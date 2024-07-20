import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/utils/constants/calculator_feature.dart';
import 'package:kodecamp_calculator_app/utils/constants/images.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/widgets/home_card_widget.dart';

class HompageScreen extends StatelessWidget {
  const HompageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CalculatorFeatureController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              const Text(
                "Popular Calculator",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: AppSizes.fontSizeLg * 1.1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppSizes.spaceBtwSectionsSm),
              Expanded(
                child: /* calculatorFeature.isNotEmpty
                    ? */
                    GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: calculatorFeature.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => calculatorFeature[index].functionPage);
                      },
                      child: HomeCardWidget(
                        index: index,
                      ),
                    );
                  },
                )
                /*    : const Center(
                        child: Text(
                          "No Calculator Available",
                          style: TextStyle(fontSize: AppSizes.fontSizeMd),
                        ),
                      ) */
                ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
