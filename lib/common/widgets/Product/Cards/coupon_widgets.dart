import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';
import '../../custom_Shapes/container/circular_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCircularContainer(
      showBorder: true,
      background: dark ? TColor.dark : TColor.white,
      padding: const EdgeInsets.only(
          left: TSize.md,
          right: TSize.sm,
          top: TSize.sm,
          bottom: TSize.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have promo code? Enter here",
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? TColor.white.withOpacity(0.5)
                          : TColor.dark.withOpacity(0.5),
                      backgroundColor: TColor.grey.withOpacity(0.1),
                      side: BorderSide(
                          color: Colors.grey.withOpacity(0.1))),
                  child: const Text("Apply")))
        ],
      ),
    );
  }
}