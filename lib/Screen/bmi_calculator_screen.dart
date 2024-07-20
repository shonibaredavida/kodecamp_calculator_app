import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/controllers/calculator_func_controller.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/widgets/calc_button_widget.dart';
import 'package:kodecamp_calculator_app/widgets/logo_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BMICalculatorController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              const Text(
                "BMI Calculator",
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
                                "Weight",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 110,
                                child: Obx(
                                  () => Text(
                                    "${controller.weight} kg",
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
                              min: 1.0,
                              enableTooltip: true,
                              max: 530.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.weight),
                              onChanged: (dynamic newValue) {
                                controller.updateWeight(newValue);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSectionsLg,
                      ),
                      //second entry
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Height",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 110,
                                child: Obx(
                                  () => Text(
                                    "${controller.height} cm",
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
                              min: 0.5,
                              enableTooltip: true,
                              max: 300.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.height),
                              onChanged: (dynamic newValue) {
                                controller.updateHeight(newValue);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSectionsLg,
                      ),
                      // results
                      Obx(
                        () {
                          controller.getBmi();
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                //BMI result
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Your Body Mass Index (BMI)",
                                        style: TextStyle(
                                            fontSize: AppSizes.fontSizeMd)),
                                    Text(
                                      "${controller.bmi} kg/m²",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),

                                //principal amount used in computation
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Height",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      "${controller.heightString} m  ",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),
                                //Total interest
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Weight",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      "${controller.weight} kg  ",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ), //Total Amount
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsMd,
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

  SnackbarController showResult(BMICalculatorController controller) {
    return Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
        messageText: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Your Body Mass Index is ${controller.bmi} kg/m² ",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: AppSizes.fontSizeLg),
          ),
        ),
      ),
    );
  }
}
