import 'package:e_mart/common/widgets/icon/t_circular_icon.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColor.darkerGrey : TColor.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSize.cardRadiusLg),
              topRight: Radius.circular(TSize.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: TColor.darkGrey,
                color: TColor.white,
              ),
              const SizedBox(
                width: TSize.spaceBtwItems,
              ),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSize.spaceBtwItems,
              ),
              const TCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: TColor.black,
                color: TColor.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: TColor.black,
                side: const BorderSide(color: TColor.black)),
            child: const Text("Add to Carts"),
          )
        ],
      ),
    );
  }
}
