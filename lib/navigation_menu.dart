import "package:e_mart/features/personalisation/screens/Setting/setting.dart";
import "package:e_mart/features/shop/screen/home/home_Screen.dart";
import "package:e_mart/features/shop/screen/store/store.dart";
import "package:e_mart/features/shop/screen/wishlist/wishlist.dart";
import "package:e_mart/utils/constant/colors.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColor.black : TColor.white,
          indicatorColor: darkMode ? TColor.white.withOpacity(0.1) : TColor.black.withOpacity(0.1),
          destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
          NavigationDestination(icon: Icon(Iconsax.heart), label: "WishList"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
        ],

        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screen = [const HomeScreen(),const StoreScreen(),const FavoriteScreen(), const SettingScreen(),];
}
