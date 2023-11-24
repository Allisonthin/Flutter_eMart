import 'package:flutter/material.dart ';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/sizes.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColor.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSize.iconMd,
              height: TSize.iconMd,
              image: AssetImage(TImages.google),
            ),
          ),
        ),
        const SizedBox(width: TSize.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColor.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSize.iconMd,
              height: TSize.iconMd,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),

      ],
    );
  }
}