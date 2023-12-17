import 'package:flutter/material.dart ';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/device/device_utilities.dart';
import '../../../../utils/helper/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSize.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(TSize.md),
            decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? TColor.dark
                      : TColor.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSize.cardRadiusLg),
              border: showBorder ? Border.all(color: TColor.grey) : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: TColor.darkGrey,
                ),
                const SizedBox(width: TSize.spaceBtwItems),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColor.darkGrey),
                )
              ],
            )),
      ),
    );
  }
}
