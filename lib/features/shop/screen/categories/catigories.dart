import "package:e_mart/common/widgets/Product/product_cart/product_cart_horizontal.dart";
import "package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "package:e_mart/common/widgets/images/t_rounded_image.dart";
import "package:e_mart/common/widgets/texts/section_heading.dart";
import "package:flutter/material.dart";

import "../../../../utils/constant/image_string.dart";
import "../../../../utils/constant/sizes.dart";

class CatigoriesScreen extends StatelessWidget {
  const CatigoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Sports",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                width: double.infinity,
                imageURL: TImages.productBanner1,
                applyImageRadius: true  ,
              ),
              const SizedBox(height: TSize.spaceBtwSections,),

              /// sub categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: "Sports Shirts", onPressed: (){},),
                  const SizedBox(height: TSize.spaceBtwItems/2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        separatorBuilder: (_,__) => const SizedBox(width: TSize.spaceBtwItems),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  const TProductCardHorizontal()),
                  ),

                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
