import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/screen/product_details/Widgets/product_attribute.dart';
import 'package:e_mart/features/shop/screen/product_details/Widgets/product_metadata.dart';
import 'package:e_mart/features/shop/screen/product_review/product_review.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constant/sizes.dart';
import 'Widgets/bottom_add_to_cart_widget.dart';
import 'Widgets/product_image_slider.dart';
import 'Widgets/rating_and_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(

            /// product image slider
            children: [
              const TProductImageSlider(),

              /// product image details
              Padding(
                padding: const EdgeInsets.only(
                    left: TSize.defaultSpace,
                    right: TSize.defaultSpace,
                    bottom: TSize.defaultSpace),
                child: Column(
                  children: [
                    /// rating and share button
                    const TRatingAndShare(),

                    ///  price, title, stock, and branding
                    const ProductMetaData(),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    ///  attribute
                    const TProductAttributes(),
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    ),

                    ///  checkbox button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("Checkout"))),
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    ),

                    ///  description
                    const TSectionHeading(
                      title: "Description",
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    const ReadMoreText(
                      "this is the product description of the Nike shoes air force.dfasfasdfsfsfdsf There are more to add but i will end here. this is the bumbastic plan",
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Show more",
                      trimExpandedText: " Less",
                      moreStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                      lessStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),

                    ///  reviews
                    const Divider(),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(
                          title: "Review(199)",
                          showActionButton: false,
                        ),
                        IconButton(
                            onPressed: () => Get.to(const ProductReviewScreen()),
                            icon: const Icon(
                              Iconsax.arrow_right_3,
                              size: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
