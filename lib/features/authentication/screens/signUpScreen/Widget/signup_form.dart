import 'package:e_mart/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_mart/features/authentication/screens/signUpScreen/Widget/signUp_termAndConditon.dart';
import 'package:e_mart/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../verify_email.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText("FirstName", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(
                width: TSize.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText("LastName", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText("UserName", value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.username,
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.phoneNumber,
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: controller.hidePassword.value
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// term and condition
          const TTermAndCondition(),
          const SizedBox(
            height: TSize.spaceBtwSections / 2,
          ),

          /// signup button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount),
              )),
        ],
      ),
    );
  }
}
