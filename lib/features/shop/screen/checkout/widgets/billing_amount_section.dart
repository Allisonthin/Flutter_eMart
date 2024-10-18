import 'package:flutter/material.dart';

import '../../../../../utils/constant/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 2,
        ),

        /// shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$20",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 2,
        ),

        /// tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$2",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 2,
        ),

        /// total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Total",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$273",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
