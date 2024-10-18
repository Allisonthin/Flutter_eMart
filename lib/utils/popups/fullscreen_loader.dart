import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import '';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constant/colors.dart';

/// A Utility for managing a full screen loading dialog.
class TFullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// parameters:
  /// - text : the text to be display in a loading dialog.
  /// - animation : The lotties animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // use Get.overlayContext for overlay dialog
      barrierDismissible: false,
      // The dialog box can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // disable popping with the back button
        child: Container(
          color: THelperFunction.isDarkMode(Get.context!)
              ? TColor.dark
              : TColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250, // adjust the space we needed
              ),
              TAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  /// stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // close the dialog using the Navigator
  }
}
