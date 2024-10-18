import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/brandTitleWithVerifiedIcon.dart';
import '../../texts/t_product_title.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark  = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageURL: TImages.productImage1,
          width: 60,
          height: 60,
          padding:  const EdgeInsets.all(TSize.sm),
          background: dark ? TColor.darkerGrey : TColor.light,
        ),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),

        /// Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: "Nike"),
              const Flexible(child: TProductTitle(title: "Blue Sports Shoes", maxLine: 1 ,)),
              /// attribute
              Text.rich(TextSpan(children:
              [
                TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: " Blue  ",style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: "Size ",style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: " UK 08  ",style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}