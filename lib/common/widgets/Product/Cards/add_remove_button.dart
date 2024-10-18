import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';
import '../../icon/t_circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        /// Add Remove button
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSize.md,
          color: dark ? TColor.white : TColor.black,
          backgroundColor: dark ? TColor.darkerGrey : TColor.grey,
        ),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        Text("3", style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        const TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSize.md,
          color: TColor.white,
          backgroundColor: TColor.primary,
        ),
      ],
    );
  }
}