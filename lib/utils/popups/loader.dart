import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constant/colors.dart';

class TLoader {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunction.isDarkMode(Get.context!)
                ? TColor.darkerGrey.withOpacity(0.9)
                : TColor.grey.withOpacity(0.9),
          ),
          child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          )),
    ));
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: TColor.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColor.white),
    );
  }

  static warningSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColor.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColor.white),
    );
  }

  static errorSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColor.white),
    );
  }
}
