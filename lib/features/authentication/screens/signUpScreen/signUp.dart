import "package:e_mart/common/widgets/login_signup/form_divider.dart";
import "package:e_mart/common/widgets/login_signup/social_button.dart";
import "package:e_mart/features/authentication/screens/signUpScreen/verify_email.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/constant/text_string.dart';
import "Widget/signup_form.dart";

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(
                  TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),

                /// Form
                const TSignUpForm(),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),

                /// signup button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=> const VerifyEmailScreen());
                      },
                      child: const Text(TTexts.createAccount),
                    )),
                const SizedBox(
                  height: TSize.spaceBtwSections / 2,
                ),

                /// Divider
                const TFormDivider(dividerText: TTexts.signUpWith),
                const SizedBox(
                  height: TSize.spaceBtwSections / 2,
                ),

                /// Footer
                const TSocialButton(),
                const SizedBox(
                  height: TSize.spaceBtwSections / 2,
                ),
              ],
            ),
          ),
        ));
  }
}


