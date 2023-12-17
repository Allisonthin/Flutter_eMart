import 'package:flutter/material.dart';

import '../../../../../common/widgets/ImageTextWidget/Vertical_Image_Text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = [TImages.sportCategories, TImages.shoesCategories, TImages.watchCategories, TImages.shirtCategories, TImages.electronicCategories,TImages.furnitureCategories];
    final imageTitle = ["Sports", "Shoes", "Watch", "Shirts", "Electronic", "Furniture"];
    return Padding(
      padding: const EdgeInsets.only(left: TSize.defaultSpace),
      child: Column(
        children: [
          /// heading
          const TSectionHeading(
            title: 'Product Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: TSize.spaceBtwItems,
          ),

          /// categories
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (_, index) {
                  return TVerticalImage(image: imageList[index], title: imageTitle[index], onTap: (){},);
                }),
          )
        ],
      ),
    );
  }
}