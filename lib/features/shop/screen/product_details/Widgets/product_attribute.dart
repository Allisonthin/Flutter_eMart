import "package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart";
import "package:e_mart/common/widgets/texts/productPrice.dart";
import "package:e_mart/common/widgets/texts/section_heading.dart";
import "package:e_mart/common/widgets/texts/t_product_title.dart";
import "package:e_mart/utils/helper/helper_functions.dart";
import "package:flutter/material.dart";

import "../../../../../common/widgets/chips/choice_chip.dart";
import "../../../../../utils/constant/colors.dart";
import "../../../../../utils/constant/sizes.dart";

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Column(
      children: [
        /// ---selected pricing and attributes
        TCircularContainer(
          padding: const EdgeInsets.all(TSize.md),
          background: dark ? TColor.darkGrey : TColor.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title, price and stock
              Row(
                children: [
                  const TSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSize.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitle(
                            title: "Price:  ",
                            smallSize: true,
                          ),

                          /// Actual price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSize.spaceBtwItems),

                          /// Sale price
                          const TProductPriceText(price: "20"),
                        ],
                      ),

                      /// stock
                      Row(
                        children: [
                          const TProductTitle(
                            title: 'Stock:  ',
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// variation description
              const TProductTitle(
                title:
                    'this is the description of the product  and it can goes upto 4 line',
                maxLine: 4,
                smallSize: true,
              )
            ],
          ),
        ),

        const SizedBox(
          height: TSize.spaceBtwItems,
        ),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Color" , showActionButton: false,),
            const SizedBox(
              height: TSize.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Size" , showActionButton: false,),
            const SizedBox(
              height: TSize.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '27', selected: true, onSelected: (value){},),
                TChoiceChip(text: '29', selected: false, onSelected: (value){},),
                TChoiceChip(text: '30', selected: false, onSelected: (value){},),
              ],
            )
          ],
        )
      ],
    );
  }
}


