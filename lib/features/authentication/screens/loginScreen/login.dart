import 'package:e_mart/common/style/spacing_style.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/constant/text_string.dart';
import 'Widget/loginForm.dart';
import 'Widget/loginHeader.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///app icon, title,sub title
              TLoginHeader(dark: dark),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.signInWith.capitalize!,),
              const SizedBox(height: TSize.spaceBtwSections,),

              /// Footer
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}








