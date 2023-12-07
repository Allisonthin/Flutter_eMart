import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageURL,
    this.width,
    this.height,
    this.padding,
    this.applyImageRadius = true,
    this.border,
    this.background =TColor.light,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSize.md,
  });

  final String imageURL;
  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color background;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageURL)
                  : AssetImage(imageURL) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}