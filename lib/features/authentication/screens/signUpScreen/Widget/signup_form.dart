import 'package:e_mart/features/authentication/screens/signUpScreen/Widget/signUp_termAndConditon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Form(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.username,
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// term and condition
          const TTermAndCondition(),
        ],
      ),
    );
  }
}

