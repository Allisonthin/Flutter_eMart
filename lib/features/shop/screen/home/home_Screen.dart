import "package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "package:e_mart/features/shop/screen/home/widgets/home_appbar.dart";
import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "../../../../common/widgets/custom_Shapes/container/primary_container.dart";
import "../../../../common/widgets/product_cart/cart_menu_icon.dart";
import "../../../../utils/constant/colors.dart";
import "../../../../utils/constant/text_string.dart";

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
                children: [
                  /// AppBar
                  THomeAppBar(),

                  /// Searching
                  /// Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
