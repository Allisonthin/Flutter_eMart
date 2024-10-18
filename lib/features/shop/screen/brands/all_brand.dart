import 'package:e_mart/common/widgets/Brands/brand_card.dart';
import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/common/widgets/layouts/gridLayout.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/screen/brands/brand_Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: "Brands",
                showActionButton: false,
              ),
              const SizedBox(height: TSize.spaceBtwSections),

              /// brands
              TGridViewLayout(
                  itemCount: 10,
                  mainAxisExtend: 80,
                  itemBuilder: (_, index) => TBrandCard(
                        showBorder: true,
                        onTab: () => Get.to(() => const BrandsProduct()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
