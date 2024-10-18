import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_Shapes/container/circular_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TBillingSection extends StatelessWidget {
  const TBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: "Payment Method", buttonTitle: "change", onPressed: (){},),
        const SizedBox(height: TSize.spaceBtwItems / 2,),
        Row(
          children: [
            TCircularContainer(
              padding: const EdgeInsets.all(TSize.sm/2),
              width: 55,
              height: 45,
              background: dark ? TColor.light : TColor.white,
              child: const Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain,),
            ),

            const SizedBox(width: TSize.spaceBtwItems/2,),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )

      ],
    );
  }
}
