import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/features/personalisation/controller/user_controller.dart';
import 'package:e_mart/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: const Text("Re_Authenticate user")
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                // email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText:  TTexts.email),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields,),

                // password
                Obx(
                  ()=> TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => TValidator.validateEmptyText("Password",value),
                    decoration: InputDecoration(prefixIcon: const Icon(Iconsax.password_check), labelText:  TTexts.password,
                    suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: const Icon(Iconsax.eye_slash))
                    ),
                  ),
                ),

                const SizedBox(height: TSize.spaceBtwSections),
                ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text("Verify")),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
