import 'package:e_mart/common/widgets/Product/product_cart/product_cart_vertical.dart';
import 'package:e_mart/common/widgets/layouts/gridLayout.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/Brands/brand_show_case.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';

class TCategoriesTab extends StatelessWidget {
  const TCategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
                /// Brands
                const TBrandShowCase(
                  image: [
                    TImages.productImageNike1,
                    TImages.productImageNike2,
                    TImages.productImageNike3
                  ],
                ),
                const TBrandShowCase(
                  image: [
                    TImages.productImageNike1,
                    TImages.productImageNike2,
                    TImages.productImageNike3
                  ],
                ),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),

                /// product
                TSectionHeading(
                  title: "Product you may like",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),

                TGridViewLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCartVertical()),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
              ],
            ),
          ),
        ]);
  }
}
