import 'package:flutter/material.dart';
import 'package:kodecamp_calculator_app/utils/constants/calculator_feature.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.index,
    /*  required this.calcFunctionPix,
    required this.calcFuntionTitle,
  */
  });
  final int index;
  /*  final String calcFunctionPix;
  final String calcFuntionTitle;
 */
  @override
  Widget build(BuildContext context) {
    final calculatorDetails = calculatorFeature[index];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: gridItemColor.withOpacity(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                calculatorDetails.pix,
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    calculatorDetails.shortName ?? calculatorDetails.name,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: calculatorDetails.shortName != null
                            ? AppSizes.fontSizeSm
                            : AppSizes.fontSizeMs),
                  ),
                  Text(
                    "Calculator",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: calculatorDetails.shortName != null
                            ? AppSizes.fontSizeSm
                            : AppSizes.fontSizeMs),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
