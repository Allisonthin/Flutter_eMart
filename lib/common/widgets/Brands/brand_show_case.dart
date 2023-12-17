import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_Shapes/container/circular_container.dart';
import 'brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      showBorder: true,
      borderColor: TColor.darkGrey,
      background: Colors.transparent,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
          ///Brand with Product Counts
          const TBrandCard(showBorder: false,),
          const SizedBox(height: TSize.spaceBtwItems,),
          /// Brand Top 3 product image
          Row(
            children: image.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),

        ],
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context){
    return Expanded(child: TCircularContainer(
      height: 100,
      margin: const EdgeInsets.only(right: TSize.sm),
      padding: const EdgeInsets.all(TSize.md),
      background: THelperFunction.isDarkMode(context) ? TColor.darkerGrey : TColor.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ));
  }
}