import 'package:e_mart/features/authentication/controller/onBoarding/onBoarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtils.getAppBarHeight(),right: TSize.defaultSpace,
        child: TextButton(onPressed: () {OnBoardingController.instance.skipPage();},
          child: const Text("Skip"),));
  }
}