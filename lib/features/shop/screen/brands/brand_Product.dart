import 'package:e_mart/common/widgets/Brands/brand_card.dart';
import 'package:e_mart/common/widgets/Product/sortable/sortable_product.dart';
import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/sizes.dart';

class BrandsProduct extends StatelessWidget {
  const BrandsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              TBrandCard(showBorder: true),
              SizedBox(height: TSize.spaceBtwSections,),

              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
