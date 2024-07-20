import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/function/calculator_function.dart';
import 'package:kodecamp_calculator_app/controllers/fd_calculator_controller.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/widgets/calc_button_widget.dart';
import 'package:kodecamp_calculator_app/widgets/logo_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../utils/format.dart';

class FDCalculatorScreen extends StatelessWidget {
  const FDCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FDCalculatorController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              const Text(
                "Fixed Deposit (FD) Calculator",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: AppSizes.fontSizeLg * 1.1,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      //first entry
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Investment",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 120,
                                child: Obx(
                                  () => Text(
                                    "\$ ${controller.amtInvested} ",
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
                              max: 1000000.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.amtInvested),
                              onChanged: (dynamic newValue) {
                                controller.updateAmtInvested(newValue);
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
                                "Rate of Interest (p.a)",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 120,
                                child: Obx(
                                  () => Text(
                                    "${controller.rate} %",
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
                              max: 30.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.rate),
                              onChanged: (dynamic newValue) {
                                controller.updateRate(newValue);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSectionsLg,
                      ),
                      //third entry
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Time Period",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 120,
                                child: Obx(
                                  () => Text(
                                    "${controller.period} Yr",
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
                              max: 20.0,
                              activeColor: primary,
                              inactiveColor: gridItemColor,
                              value: double.parse(controller.period),
                              onChanged: (dynamic newValue) {
                                controller.updatePeriod(newValue);
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
                          controller.getEstReturn();
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                //Monthly EMI used in computation
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Invested Amount",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      toCurrency(controller.amtInvested)
                                          .toString(),
                                      style: const TextStyle(
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
                                      "Est. Returns",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      toCurrency(controller.estReturn)
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),
                                //Total Value

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total Value",
                                      style: TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                    Text(
                                      toCurrency(controller.totalAmount)
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: AppSizes.fontSizeMd),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsSm,
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
                                        showResult(
                                            "Monthly EMI:  ${toCurrency(controller.amtInvested)}");
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
}
