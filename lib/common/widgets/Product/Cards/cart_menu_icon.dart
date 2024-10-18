import 'package:e_mart/features/shop/screen/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';


class TCartCounter extends StatelessWidget {
  const TCartCounter({
    super.key, this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: ()=> Get.to(const CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColor.white, fontSizeFactor: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}