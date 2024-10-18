import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? TColor.darkerGrey : TColor.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
