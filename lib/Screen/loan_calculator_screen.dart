import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/controllers/calculator_func_controller.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';
import 'package:kodecamp_calculator_app/utils/format.dart';
import 'package:kodecamp_calculator_app/widgets/calc_button_widget.dart';
import 'package:kodecamp_calculator_app/widgets/logo_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LoanCalculatorScreen extends StatelessWidget {
  const LoanCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoanCalculatorController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              const Text(
                "Loan Calculator",
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
                                "Loan Amount",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 150,
                                child: Obx(
                                  () => Text(
                                    "\$ ${controller.loanAmt} ",
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
                              value: double.parse(controller.loanAmt),
                              onChanged: (dynamic newValue) {
                                controller.updateAmt(newValue);
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSectionsSm,
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
                                width: 150,
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
                        height: AppSizes.spaceBtwSectionsSm,
                      ),
                      //third entry
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Loan Tenure",
                                style: TextStyle(fontSize: AppSizes.fontSizeMd),
                              ),
                              Container(
                                color: gridItemColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 150,
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
                        height: AppSizes.spaceBtwSectionsMd,
                      ),
                      // results
                      Obx(
                        () {
                          controller.getMonthlyAmount();
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
                                    const Text("Monthly EMI"),
                                    Text(toCurrency(controller.monthlyPayment)),
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
                                    const Text("Principal Amount"),
                                    Text(toCurrency(controller.loanAmt)),
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
                                    const Text("Total Interest"),
                                    Text(toCurrency(controller.totalInterest)),
                                  ],
                                ), //Total Amount
                                const SizedBox(
                                  height: AppSizes.spaceBtwSectionsXsm,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Total Amount"),
                                    Text(toCurrency(controller.totalAmount)),
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

  SnackbarController showResult(LoanCalculatorController controller) {
    return Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
        messageText: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Monthly EMI is ${toCurrency(controller.monthlyPayment)}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: AppSizes.fontSizeLg),
          ),
        ),
      ),
    );
  }
}
