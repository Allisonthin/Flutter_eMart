import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_Shapes/container/circular_container.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCircularContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSize.md),
      background:
          isSelected ? TColor.primary.withOpacity(0.8) : Colors.transparent,
      borderColor: isSelected
          ? Colors.transparent
          : dark
              ? TColor.darkerGrey
              : TColor.grey,
      margin: const EdgeInsets.only(
        bottom: TSize.spaceBtwItems,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(isSelected ? Iconsax.tick_circle5 : null,
                color: isSelected
                    ? dark
                        ? TColor.light
                        : TColor.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John hao",
              maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: TSize.sm /2,),
              Text("(+91) 79500 34421",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: TSize.sm /2,),
              const Text("795009, Kwakeithal-MayaiKoibi, Imphal-West, Manipur, India", softWrap: true,)
            ],
          )
        ],
      ),
    );
  }
}
