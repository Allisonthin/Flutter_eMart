import "package:flutter/material.dart";

import "../../../../utils/constant/colors.dart";

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key, this.width = 400, this.height =400, this.radius = 400, this.padding = 0, this.child,  this.background = TColor.white,
  });

  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
  }
}