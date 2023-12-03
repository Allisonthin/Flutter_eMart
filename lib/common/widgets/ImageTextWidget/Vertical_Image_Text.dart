import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class TVerticalImage extends StatelessWidget {
  const TVerticalImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColor.white,
    this.backgroundColor = TColor.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItems),
        child: Column(
          children: [
            /// circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSize.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ?? (dark ? TColor.black : TColor.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                color: dark ? TColor.dark : TColor.light,
              ),
            ),

            /// texts
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ))
          ],
        ),
      ),
    );
  }
}