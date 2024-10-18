import 'package:e_mart/common/widgets/custom_Shapes/container/search_container.dart';
import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/common/widgets/layouts/gridLayout.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/screen/brands/all_brand.dart';
import 'package:e_mart/features/shop/screen/brands/brand_Product.dart';
import 'package:e_mart/features/shop/screen/store/widget/categories_tab.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/AppBar/TabBar.dart';
import '../../../../common/widgets/Brands/brand_card.dart';
import '../../../../common/widgets/Product/Cards/cart_menu_icon.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [TCartCounter(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColor.black : TColor.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSize.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// search bar
                      const SizedBox(
                        height: TSize.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwSections,
                      ),

                      /// Featured Branding
                      TSectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 1.5,
                      ),

                      /// brands Grib
                      TGridViewLayout(
                          itemCount: 4,
                          mainAxisExtend: 80,
                          itemBuilder: (_, index) {
                            return TBrandCard(
                              showBorder: false,
                              onTab: () => Get.to(() => const BrandsProduct()),
                            );
                          })
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text("Sports"),
                    ),
                    Tab(
                      child: Text("Furniture"),
                    ),
                    Tab(
                      child: Text("Electronic"),
                    ),
                    Tab(
                      child: Text("Clothes"),
                    ),
                    Tab(
                      child: Text("Watch"),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              TCategoriesTab(),
              TCategoriesTab(),
              TCategoriesTab(),
              TCategoriesTab(),
              TCategoriesTab(),
            ],
          ),
        ),
      ),
    );
  }
}
