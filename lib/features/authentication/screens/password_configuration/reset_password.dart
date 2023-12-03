import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/constant/text_string.dart';
import '../../../../utils/helper/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                  onPressed: (){},
                  child:  const Text(TTexts.done)),
            ),
            const SizedBox(height: TSize.spaceBtwItems,),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: (){},
                  child:  const Text(TTexts.resendEmail)),
            ),

          ],),
        ),
      ),


    );
  }
}
