import 'package:flutter/material.dart';

import '../../../../../common/widgets/Product/Cards/add_remove_button.dart';
import '../../../../../common/widgets/Product/Cards/cart_item.dart';
import '../../../../../common/widgets/texts/productPrice.dart';
import '../../../../../utils/constant/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSize.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButton)
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),

          /// add remove button row with total price
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra space
                    SizedBox(
                      width: 70,
                    ),

                    /// Add Remove Button
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: "250"),
              ],
            )
        ],
      ),
    );
  }
}
