import "package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "package:e_mart/features/shop/screen/cart/widgets/cart_item.dart";
import "package:e_mart/features/shop/screen/checkout/checkout.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../utils/constant/sizes.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Carts",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: TCartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text("Checkout \$250"),),
      ),
    );
  }
}


