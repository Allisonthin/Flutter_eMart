import 'package:e_mart/common/widgets/images/t_circular_image.dart';
import 'package:e_mart/common/widgets/texts/brandTitleWithVerifiedIcon.dart';
import 'package:e_mart/common/widgets/texts/productPrice.dart';
import 'package:e_mart/common/widgets/texts/t_product_title.dart';
import 'package:e_mart/utils/constant/enums.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_Shapes/container/circular_container.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///  price and sale price
        Row(
          children: [
            /// sale tage
            TCircularContainer(
              radius: TSize.sm,
              background: TColor.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSize.sm, vertical: TSize.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColor.black),
              ),
            ),
            const SizedBox(width: TSize.spaceBtwItems,),

            /// price
            Text("\$250", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSize.spaceBtwItems,),
            const TProductPriceText(price: "170", isLarge: true,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems / 1.5,),

        ///  title
        Text("Nike Air Force", style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: TSize.spaceBtwItems / 1.5,),


        ///  stock
        Row(
          children: [
            const TProductTitle(title: "Status"),
            const SizedBox(width: TSize.spaceBtwItems),
            Text("In stock", style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height : TSize.spaceBtwItems,),


        ///  branding
        Row(
          children: [
            TCircularImage(image: TImages.nike,
            width: 32,
              height: 32,
              overlayColor: dark ? TColor.white: TColor.black,
            ),

            const SizedBox(width: TSize.spaceBtwItems),
            const TBrandTitleWithVerifiedIcon(title: "Nike", brandTextSize: TextSizes.medium,),
          ],
        )

      ],

    );
  }
}
