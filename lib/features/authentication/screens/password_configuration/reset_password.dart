import 'package:e_mart/features/authentication/controller/forgetPassword/forgetPasswordController.dart';
import 'package:e_mart/features/authentication/screens/loginScreen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/constant/text_string.dart';
import '../../../../utils/helper/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(children: [
            ///image
            Image(image: const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunction.screenWidth() * 0.6,),
            const SizedBox(height: TSize.spaceBtwSections,),

            /// Title and sub title
            Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSize.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSize.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            /// button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => LoginScreen()),
                  child:  const Text(TTexts.done)),
            ),
            const SizedBox(height: TSize.spaceBtwItems,),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resentPasswordResetEmail(email),
                  child:  const Text(TTexts.resendEmail)),
            ),

          ],),
        ),
      ),


    );
  }
}
