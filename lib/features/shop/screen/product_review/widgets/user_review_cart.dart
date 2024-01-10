import 'package:e_mart/common/widgets/Product/Rating/rating_bar_indicator.dart';
import 'package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';

class UserReviewCart extends StatelessWidget {
  const UserReviewCart({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.profileImage),),
                const SizedBox(width: TSize.spaceBtwItems),
                Text("Joe Biden", style: Theme.of(context).textTheme.bodyLarge,)
              ],
            ),
            
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),

        const SizedBox(height: TSize.spaceBtwItems,),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.5,),
            const SizedBox(width: TSize.spaceBtwItems,),
            Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

        const SizedBox(height: TSize.spaceBtwItems,),
        const ReadMoreText("this the user interface is quite interesting, i was enable to navigate to this page . this is what i want , bumbastic idea",
        trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " Show More",
          trimCollapsedText: " Show Less",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColor.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColor.primary),
        ),

        const SizedBox(height: TSize.spaceBtwItems,),

        /// company review
        TCircularContainer(
          background: dark ? TColor.darkerGrey : TColor.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("K's company", style: Theme.of(context).textTheme.titleMedium,),
                    Text("09 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,),

                  ],
                ),
                const SizedBox(height: TSize.spaceBtwItems,),
                const ReadMoreText("this the user interface is quite interesting, i was enable to navigate to this page . this is what i want , bumbastic idea",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " Show More",
                  trimCollapsedText: " Show Less",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColor.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColor.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSize.spaceBtwSections,),

      ],
    );
  }
}
