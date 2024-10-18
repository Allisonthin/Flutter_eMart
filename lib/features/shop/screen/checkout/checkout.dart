import "package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart";
import "package:e_mart/common/widgets/success_screen/success_screen.dart";
import 'package:e_mart/features/shop/screen/checkout/widgets/address_section.dart';
import "package:e_mart/features/shop/screen/checkout/widgets/billing_amount_section.dart";
import "package:e_mart/features/shop/screen/checkout/widgets/billing_section.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../common/widgets/Product/Cards/coupon_widgets.dart";
import "../../../../common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "../../../../navigation_menu.dart";
import "../../../../utils/constant/colors.dart";
import "../../../../utils/constant/image_string.dart";
import "../../../../utils/constant/sizes.dart";
import "../cart/widgets/cart_item.dart";

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// --items in cart
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// coupon textfield
              const TCouponCode(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// Billing Section
              TCircularContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSize.md),
                  background: dark ? TColor.black : TColor.white,
                  child: const Column(
                    children: [
                      /// Pricing
                      TBillingAmountSection(),
                      SizedBox(
                        height: TSize.spaceBtwItems,
                      ),

                      /// Divider
                      Divider(),
                      SizedBox(
                        height: TSize.spaceBtwItems,
                      ),

                      /// Payment Methods
                      TBillingSection(),
                      SizedBox(
                        height: TSize.spaceBtwItems,
                      ),

                      /// Address
                      TBillingAddressSection()
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.paymentSuccess,
              title: 'Payment Success ',
              subTitle: "Your item will be shipped soon",
            onPressed: () => Get.offAll(const NavigationMenu()),
          )),
          child: const Text("Checkout \$250"),
        ),
      ),

    );
  }
}
