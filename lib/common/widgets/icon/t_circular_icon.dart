import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.size = TSize.lg,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor! :
            dark ? TColor.black.withOpacity(0.3)
            : TColor.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: () {}, icon: Icon(icon, color: color, size: size), ),
    );
  }
}
