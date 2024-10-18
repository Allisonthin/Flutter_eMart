import 'package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart';
import 'package:e_mart/common/widgets/texts/brandTitleWithVerifiedIcon.dart';
import 'package:e_mart/common/widgets/texts/productPrice.dart';
import 'package:e_mart/common/widgets/texts/t_product_title.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../icon/t_circular_icon.dart';
import '../../images/t_rounded_image.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? TColor.darkerGrey : TColor.lightContainer,
        ),
    child: Row(
      children: [
        /// thumbnail
        TCircularContainer(
          height: 120,
            padding: const EdgeInsets.all(TSize.sm),
          background: dark ? TColor.dark : TColor.light,
          child: Stack(
            children:[
              /// thumnail image
            const TRoundedImage(
              width: 120,
                height: 120,
              imageURL: TImages.nike, applyImageRadius: true,),

              /// Sale tags
              Positioned(
                top: 12,
                child: TCircularContainer(
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
              ),

              /// Favorite Icon button
               const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ))
            ]

          ),
        ),

        /// details
         SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm ),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitle(title: "Nike with half sleeve shirts", smallSize: true,),
                    SizedBox(height: TSize.spaceBtwItems,),
                    TBrandTitleWithVerifiedIcon(title: "Nike"),
                  ],
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// pricing
                    const Flexible(child: TProductPriceText(price: "25")),

                    /// add to cart
                    Container(
                      decoration: const BoxDecoration(
                          color: TColor.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSize.cardRadiusMd),
                              bottomRight:
                              Radius.circular(TSize.productImageRadius))),
                      child: const SizedBox(
                          width: TSize.iconLg * 1.2,
                          height: TSize.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColor.white,
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
        
      ],
    )
      );
  }
}
