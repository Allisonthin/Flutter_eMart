import 'package:e_mart/common/widgets/custom_Shapes/container/circular_container.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __,) =>const SizedBox(height: TSize.spaceBtwItems,),
      itemBuilder: (_, index) => TCircularContainer(
        background: dark ? TColor.dark : TColor.light,
        showBorder: true,
        padding: const EdgeInsets.all(TSize.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// row 1
            Row(
              children: [
                /// 1 - icons
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSize.spaceBtwItems / 2,
                ),

                /// status and shipping
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Processing",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColor.primary, fontWeightDelta: 1)),
                      Text("09 Feb 2024", style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
                /// icon
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: TSize.iconSm,))
              ],
            ),

            const SizedBox(height: TSize.spaceBtwItems,),

            /// 2 row
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - icons
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: TSize.spaceBtwItems / 2,
                      ),

                      /// status and shipping
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Order",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium),
                            Text("[#2478F2]", style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// 1 - icons
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: TSize.spaceBtwItems / 2,
                      ),

                      /// status and shipping
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Shipping Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium),
                            Text("#2478F2", style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
