import "package:carousel_slider/carousel_slider.dart";
import "package:e_mart/common/widgets/Product/product_cart/product_cart_vertical.dart";
import "package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart";
import "package:e_mart/common/widgets/layouts/gridLayout.dart";
import "package:e_mart/features/shop/screen/home/widgets/Promo_Slider.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_appbar.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_categories.dart";
import "package:e_mart/utils/constant/colors.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";
import "../../../../common/widgets/ImageTextWidget/Vertical_Image_Text.dart";
import "../../../../common/widgets/custom_Shapes/container/primary_container.dart";
import "../../../../common/widgets/custom_Shapes/container/search_container.dart";
import "../../../../common/widgets/images/t_rounded_image.dart";
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
                    borderColor: true,
                  ),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// Categories
                  THomeCategories()
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

                    /// Popular product
                    TGridViewLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCartVertical())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
