import 'package:e_mart/common/widgets/texts/t_BrandedTextTitle.dart';
import 'package:e_mart/utils/constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandedTitleText(
          title: title,
          color: textColor,
          maxLines: maxLine,
          textAlign: textAlign,
          brandTextSizes: brandTextSize,
        )),
        const SizedBox(
          height: TSize.sm,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColor.primary,
          size: TSize.iconXs,
        )
      ],
    );
  }
}
