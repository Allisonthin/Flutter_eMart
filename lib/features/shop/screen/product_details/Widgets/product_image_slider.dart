import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_Shapes/curved_edge/curved_edge_widget.dart';
import '../../../../../common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import '../../../../../common/widgets/icon/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColor.darkerGrey : TColor.light,
        child: Stack(
          children: [
            /// main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.nikeshoes1),
                  ),
                ),
              ),
            ),
            /// image slider
            Positioned(
              right: 0,
              left: TSize.spaceBtwItems,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated( separatorBuilder: (_, __) => const SizedBox(width: TSize.spaceBtwItems,),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) =>
                      TRoundedImage(
                          width: 80,
                          border: Border.all(color: TColor.primary),
                          padding: const EdgeInsets.all(TSize.sm),
                          background: dark ? TColor.dark : TColor.white,
                          imageURL: TImages.nikeshoes2) ,),
              ),
            ),
            /// appicon
            const TAppBar(
              showBackArrow: true,
              action: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}