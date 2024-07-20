import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodecamp_calculator_app/utils/constants/sizes.dart';

SnackbarController showResult(text) {
  return Get.showSnackbar(
    GetSnackBar(
      duration: const Duration(seconds: 3),
      messageText: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: AppSizes.fontSizeLg),
        ),
      ),
    ),
  );
}
