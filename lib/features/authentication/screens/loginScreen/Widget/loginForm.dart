import 'package:e_mart/features/authentication/controller/login/login_controller.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_mart/features/authentication/screens/signUpScreen/signUp.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((LoginController()));

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSize.spaceBtwSections),
        child: Column(
          children: [

          /// Email
          TextFormField(
          controller: controller.emailController,
          validator: (value) => TValidator.validateEmail(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email),
        ),
        const SizedBox(
          height: TSize.spaceBtwInputFields,
        ),

        /// Password
        Obx(
              () =>
              TextFormField(
                controller: controller.passwordController,
                validator: (value) =>
                    TValidator.validateEmptyText("Password", value),
                obscureText: controller.hidePass.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () =>
                        controller.hidePass.value =
                        !controller.hidePass.value,
                        icon: controller.hidePass.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye))),
              ),
        ),
        const SizedBox(
          height: TSize.spaceBtwInputFields / 2,
        ),

        /// Remember me and Forget Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Remember me
            Row(
              children: [
                Obx(() =>
                    Checkbox(value: controller.rememberMe.value,
                        onChanged: (value) =>
                        controller.rememberMe.value =
                        !controller.rememberMe.value)),
                  const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            /// Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignin(),
                    child: const Text(TTexts.signIn))),

            const SizedBox(
              height: TSize.spaceBtwItems,
            ),

            /// Create account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}