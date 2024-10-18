import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/sizes.dart';
import '../../layouts/gridLayout.dart';
import '../product_cart/product_cart_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ["Name", "Higher Price", 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList()
          ,),
        const SizedBox(height: TSize.spaceBtwSections,),

        /// product
        TGridViewLayout(itemCount: 4, itemBuilder: (_,index) => const TProductCartVertical(), )
      ],
    );
  }
}