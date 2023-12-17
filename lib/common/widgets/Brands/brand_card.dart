import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/enums.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_Shapes/container/circular_container.dart';
import '../images/t_circular_image.dart';
import '../texts/brandTitleWithVerifiedIcon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTab
  });

  final bool showBorder;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTab,
      child: TCircularContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(TSize.sm),
        background: Colors.transparent,
        child: Row(
          children: [
            /// icon
            Flexible(
              child: TCircularImage(
                image: TImages.brandImage1,
                overlayColor:
                dark ? TColor.white : TColor.black,
                backgroundColor: Colors.transparent,
              ),
            ),

            const SizedBox(
              width: TSize.spaceBtwItems / 2,
            ),

            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}