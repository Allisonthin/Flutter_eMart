import "package:e_mart/common/widgets/Product/product_cart/product_cart_vertical.dart";
import "package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "package:e_mart/common/widgets/icon/t_circular_icon.dart";
import "package:e_mart/common/widgets/layouts/gridLayout.dart";
import "package:e_mart/features/shop/screen/home/home_Screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";

import "../../../../utils/constant/sizes.dart";

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("WishList", style: Theme.of(context).textTheme.headlineMedium,),
        action: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TGridViewLayout(itemCount: 4, itemBuilder: (_,index) => const TProductCartVertical())
            ],
          ),
        ),
      ),
    );
  }
}
