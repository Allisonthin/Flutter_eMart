import "package:e_mart/features/shop/screen/product_review/widgets/overall_rating.dart";
import 'package:e_mart/common/widgets/Product/Rating/rating_bar_indicator.dart';
import "package:e_mart/features/shop/screen/product_review/widgets/user_review_cart.dart";
import "package:flutter/material.dart";

import "../../../../common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "../../../../utils/constant/sizes.dart";

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Appbar
      appBar: const TAppBar(
        title: Text("Reviews & Ratings",),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified from people who use the same type of product "),
              const SizedBox(height: TSize.spaceBtwItems,),

              /// Overall product ratings
              const TOverallRating(),
              const TRatingBarIndicator(rating: 3.5,),
              Text("20,235", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSize.spaceBtwSections,),

              /// list of user review
              const UserReviewCart(),
              const UserReviewCart(),
              const UserReviewCart(),
              const UserReviewCart(),
            ],
          ),
        ),
      ),
    );
  }
}





