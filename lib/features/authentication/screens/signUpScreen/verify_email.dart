import "package:e_mart/common/widgets/success_screen/success_screen.dart";
import "package:e_mart/data/repositories/authentication/authentication_repository.dart";
import "package:e_mart/features/authentication/controller/signup/verify_email_controller.dart";
import "package:e_mart/features/authentication/screens/loginScreen/login.dart";
import "package:e_mart/utils/constant/image_string.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../utils/constant/sizes.dart";
import "../../../../utils/constant/text_string.dart";

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.verifyEmailIllustration),
                width: THelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSize.defaultSpace,
              ),

              /// title and SubTitle
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),

              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),

              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(TTexts.tContinue)),
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendVerifyEmail(), child: const Text(TTexts.resendEmail)),
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
