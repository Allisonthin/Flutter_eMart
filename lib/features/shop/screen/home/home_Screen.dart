import "package:e_mart/features/shop/screen/home/widgets/home_appbar.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_categories.dart";
import "package:e_mart/utils/constant/colors.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";
import "../../../../common/widgets/ImageTextWidget/Vertical_Image_Text.dart";
import "../../../../common/widgets/custom_Shapes/container/primary_container.dart";
import "../../../../common/widgets/custom_Shapes/container/search_container.dart";
import "../../../../common/widgets/texts/section_heading.dart";
import "../../../../utils/constant/image_string.dart";
import "../../../../utils/constant/sizes.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
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
          ],
        ),
      ),
    );
  }
}




