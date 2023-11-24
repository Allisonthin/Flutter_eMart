import 'package:e_mart/features/authentication/controller/onBoarding_controller.dart';
import 'package:e_mart/utils/constant/colors.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';

class OnBoardingNext extends StatelessWidget {
  const OnBoardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
        right: TSize.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? TColor.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
