import 'package:flutter/material.dart';
import 'package:kodecamp_calculator_app/utils/constants/colors.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(
      {super.key,
      required this.title,
      this.verticalPadding,
      this.horizontalPadding,
      this.link,
      this.icon});

  final String title;
  final IconData? icon;
  final double? verticalPadding;
  final double? horizontalPadding;
  final void Function()? link;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: link ?? () {},
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: primary,
        ),
        child: icon == null
            ? Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: AppSizes.fontSizeSm, color: Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: AppSizes.fontSizeSm,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: AppSizes.mds,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: AppSizes.fontSizeSm, color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
