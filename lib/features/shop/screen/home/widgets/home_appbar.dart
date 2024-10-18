import 'dart:developer';

import 'package:e_mart/features/personalisation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import '../../../../../common/widgets/Product/Cards/cart_menu_icon.dart';
import '../../../../../utils/Shimmer/Shimmer_Effect.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_string.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColor.grey)),

          Obx(() {
            if (controller.profileLoading.value) {
              // display shimmer loader while loading user profile is being loaded
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColor.white));
            }
          }),
        ],
      ),
      action: [
        TCartCounter(
          iconColor: TColor.white,
          onPressed: () {},
        )
      ],
    );
  }
}
