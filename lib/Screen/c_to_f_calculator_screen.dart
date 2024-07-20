import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/controllers/cel_to_fah_calculator_controller.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/widgets/calc_button_widget.dart';
import 'package:kodecamp_calculator_app/widgets/logo_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CelFahCalculatorScreen extends StatelessWidget {
  const CelFahCalculatorScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CelsiusToFahrenheitController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              const Text(
                "Celsius to Fahrenheit Calculator",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: AppSizes.fontSizeLg * 1.1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //first entry
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Celsius Value",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 100,
                                child: Obx(
                                  () => Text(
                                    "${controller.celsiusValue} ºC",
                                    style: TextStyle(
                                        color: primary,
                                        fontSize: AppSizes.fontSizeMd,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.defaultSpace,
                          ),
                          Obx(
                            () => SfSlider(
                              min: 0.0,
                              enableTooltip: true,
                              max: 530.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.celsiusValue),
                              onChanged: (dynamic newValue) {
                                controller.updateCelc(newValue);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSectionsLg,
                      ),
                      //second entry
                      // results
                      Obx(
                        () {
                          controller.getFahValue();
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                //Fahrenheit result
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Fahrenheit Value",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      "${controller.fahrenheit} F",
                                      style: const TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),

                                //celsius value used in computation
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Celsius Value",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      "${controller.celsiusValue} ºC",
                                      style: const TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),

                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CalcButton(
                                      title: "Go Back",
                                      link: () {
                                        Get.back();
                                      },
                                      icon: Icons.arrow_back_rounded,
                                    ),
                                    const SizedBox(
                                      width: AppSizes.spaceBtwSectionsMd,
                                    ),
                                    CalcButton(
                                      title: "Show Answer",
                                      link: () {
                                        showResult(controller);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SnackbarController showResult(CelsiusToFahrenheitController controller) {
    return Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
        messageText: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Celsius Value is  ${controller.fahrenheit} F",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeLg,
            ),
          ),
        ),
      ),
    );
  }
}
