import 'package:e_mart/common/style/spacing_style.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constant/sizes.dart';
import '../../../utils/constant/text_string.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle,  this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [

              ///image
              Lottie.asset(image,
                width: THelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBtwSections,),

              /// Title and sub title
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),
              Text(
                subTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSize.spaceBtwItems),

              /// button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                      child: const Text(TTexts.tContinue)),
              ),
              const SizedBox(height: TSize.spaceBtwItems,),

            ],
          ),
        ),
      ),
    );
  }
}
