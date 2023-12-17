import 'package:e_mart/features/authentication/controller/onBoarding_controller.dart';
import 'package:e_mart/utils/constant/image_string.dart';
import 'package:e_mart/utils/constant/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widget/onboarding_dotnavigation.dart';
import 'Widget/onboarding_nextbutton.dart';
import 'Widget/onboarding_page.dart';
import 'Widget/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controlled = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scroll
          PageView(
            controller: controlled.pageController,
            onPageChanged: controlled.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          /// skip button
          const OnBoardingSkip(),

          /// dot indicator
          const OnBoardingDotNavigation(),

          /// circular button
          const OnBoardingNext()
        ],
      ),
    );
  }
}

