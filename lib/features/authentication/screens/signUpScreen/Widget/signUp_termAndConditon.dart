import 'package:flutter/material.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TTermAndCondition extends StatelessWidget {
  const TTermAndCondition({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child:
            Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "${TTexts.iAgreeTo} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color:
                dark ? TColor.white : TColor.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? TColor.white : TColor.primary,
              )),
          TextSpan(
              text: " ${TTexts.and} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termOfUse,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color:
                dark ? TColor.white : TColor.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? TColor.white : TColor.primary,
              )),
        ]))
      ],
    );
  }
}