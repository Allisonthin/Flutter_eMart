import "package:e_mart/common/widgets/Product/product_cart/product_cart_vertical.dart";
import "package:e_mart/common/widgets/layouts/gridLayout.dart";
import "package:e_mart/features/shop/screen/all_product/all_product.dart";
import "package:e_mart/features/shop/screen/home/widgets/Promo_Slider.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_appbar.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_categories.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../../common/widgets/custom_Shapes/container/primary_container.dart";
import "../../../../common/widgets/custom_Shapes/container/search_container.dart";
import "../../../../common/widgets/texts/section_heading.dart";
import "../../../../utils/constant/image_string.dart";
import "../../../../utils/constant/sizes.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(height: TSize.spaceBtwSections),

                  /// Searching
                  TSearchContainer(
                    text: 'Looking for product',
                    showBackground: true,
                    showBorder: true,
                  ),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// Categories
                  THomeCategories(),

                  SizedBox(height: TSize.spaceBtwSections,)
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  /// Promo slider
                  const TPromoSlider(
                    banner: [
                      TImages.productBanner1,
                      TImages.productBanner2,
                      TImages.productBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// Heading
                  TSectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => const AllProducts())
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// Popular product
                  TGridViewLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCartVertical())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
