import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text("Bumbastic", style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: TSize.spaceBtwItems /2,),

        Row(
          children: [
              const Icon(Icons.phone,  color: Colors.grey, size: 16,),
            const SizedBox(width: TSize.spaceBtwItems),
            Text("+91 79565 42339", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2,),

        Row(
          children: [
            const Icon(Icons.location_history,  color: Colors.grey, size: 16,),
            const SizedBox(width: TSize.spaceBtwItems),
            Text("Kwakeithel-Mayai-Koibi", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2,),
      ],
    );
  }
}
