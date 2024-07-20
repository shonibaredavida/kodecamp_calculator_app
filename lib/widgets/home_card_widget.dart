import 'package:flutter/material.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.calcFunctionPix,
    required this.calcFuntionTitle,
  });

  final String calcFunctionPix;
  final String calcFuntionTitle;

  @override
  Widget build(BuildContext context) {
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
                calcFunctionPix,
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    calcFuntionTitle,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: AppSizes.fontSizeMd),
                  ),
                  const Text(
                    "Calculator",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppSizes.fontSizeMd),
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
