import "package:flutter/material.dart";

import "../../../../utils/constant/colors.dart";
import "../../../../utils/constant/sizes.dart";

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSize.cardRadiusLg,
    this.padding,
    this.child,
    this.background = TColor.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = TColor.borderPrimary,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsets? margin;
  final double radius;
  final Widget? child;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: background,
      ),
      child: child,
    );
  }
}
