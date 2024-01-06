import 'package:e_mart/common/style/shadow.dart';
import 'package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart';
import 'package:e_mart/common/widgets/images/t_rounded_image.dart';
import 'package:e_mart/features/shop/screen/product_details/product_detail.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../icon/t_circular_icon.dart';
import '../../texts/brandTitleWithVerifiedIcon.dart';
import '../../texts/productPrice.dart';
import '../../texts/t_product_title.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? TColor.darkerGrey : TColor.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, wishList, Discount Tag
            TCircularContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              background: dark ? TColor.dark : TColor.light,
              child: Stack(
                children: [
                  /// Rounded Image
                  const TRoundedImage(
                    imageURL: TImages.productImage2,
                    applyImageRadius: true,
                  ),

                  /// Sale tags
                  Positioned(
                    top: 12,
                    left: 5,
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
                ],
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),

            /// details
            const Padding(
              padding: EdgeInsets.all(TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitle(
                    title: 'Blue shoes Nike',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),
            /// Spacer() here  to keep  the height of each box same in case 1 or 2  line of heading
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: TSize.sm),
                  child: TProductPriceText(
                    price: '35',
                  ),
                ),

                /// Add to cart button
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
    );
  }
}



