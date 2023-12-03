import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import '../../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_string.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColor.grey)),
          Text(TTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColor.white)),
        ],
      ),
      action: [
        TCartCounter(iconColor: TColor.white, onPressed: (){},)
      ],
    );
  }
}