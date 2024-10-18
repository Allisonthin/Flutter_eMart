import 'dart:async';

import 'package:e_mart/common/widgets/success_screen/success_screen.dart';
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/text_string.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// send email whenever verify screen appears and  set timer  for auto  redirect.
  @override
  void onInit() {
    sendVerifyEmail();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// send verify email link
  sendVerifyEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(
          title: "Email send",
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// timer to automatically redirect email verification.
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: TImages.successRegisterAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  /// manually check  if email verified.
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: TImages.successRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
