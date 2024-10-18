import 'package:e_mart/common/widgets/custom_Shapes/container/primary_container.dart';
import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/common/widgets/listTile/Setting_menu_Tile.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/features/personalisation/screens/Address/address.dart';
import 'package:e_mart/features/shop/screen/cart/cart.dart';
import 'package:e_mart/features/shop/screen/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/listTile/User_profile_Tile.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColor.white),
                    ),
                  ),

                  /// userProfile
                  const TUserProfileTile(),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  /// account setting
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  TSettingMenuTile(icon: Iconsax.safe_home, title: "My Address", subTitle: "Set Shopping Address", onTap: () => Get.to(const UserAddressScreen()),),
                  TSettingMenuTile(icon: Iconsax.shopping_cart, title: "My Cart", subTitle: "Add, remove product and move to checkout", onTap: () => Get.to(const CartScreen()),),
                  TSettingMenuTile(icon: Iconsax.bag_tick, title: "My Order", subTitle: "In-progress and completed orders", onTap: () => Get.to(const OrderScreen()),),
                  TSettingMenuTile(icon: Iconsax.bank, title: "Bank Account", subTitle: "Withdraw balance to registered bank account", onTap: () {},),
                  TSettingMenuTile(icon: Iconsax.discount_shape, title: "My Coupons", subTitle: "List of all discounted coupons", onTap: () {},),
                  TSettingMenuTile(icon: Iconsax.notification, title: "Notification", subTitle: "Set any kind of notification message", onTap: () {},),
                  TSettingMenuTile(icon: Iconsax.security_card, title: "Account Privacy", subTitle: "Manage data usage and connected account", onTap: () {},),

                  /// app setting
                  const SizedBox(height: TSize.spaceBtwSections,),
                  const TSectionHeading(title: "Apps Setting", showActionButton: false,),
                  const SizedBox(height: TSize.spaceBtwItems,),
                  const TSettingMenuTile(icon: Iconsax.document_upload, title: "load Data", subTitle: "Upload data to your cloud firebase"),
                  TSettingMenuTile(icon: Iconsax.location, title: "Geolocation", subTitle: "Get recommendation based on your location", trailing: Switch(value: true, onChanged: (value){}),),
                  TSettingMenuTile(icon: Iconsax.security_user, title: "Safe Mode", subTitle: "search result is safe for all ages", trailing: Switch(value: false, onChanged: (value){}),),
                  TSettingMenuTile(icon: Iconsax.image, title: "HD Image quality", subTitle: "set Image quality to be seen", trailing: Switch(value: true, onChanged: (value){}),),

                  /// logout button
                  const SizedBox(height: TSize.spaceBtwSections,),
                  SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> AuthenticationRepository.instance.logout(), child: const Text("Logout"))),
                  const SizedBox(height: TSize.spaceBtwSections * 2.5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
