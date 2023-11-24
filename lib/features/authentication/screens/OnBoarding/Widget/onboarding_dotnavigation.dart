import 'package:e_mart/features/authentication/controller/onBoarding_controller.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controlled = OnBoardingController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 10,
        left: TSize.defaultSpace,
        child: SmoothPageIndicator(
          controller: controlled.pageController,
          onDotClicked: controlled.dotNavigationClick,
          count: 3,
          effect:   ExpandingDotsEffect(
              activeDotColor: dark ? TColor.light : TColor.dark, dotHeight: 4),
        ));
  }
}