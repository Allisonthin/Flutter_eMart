import 'package:e_mart/features/personalisation/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.profileImage,
        width: 50,
        height: 50,
        padding: 0,

      ),
      title: Text("Kuc", style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColor.white),),
      subtitle: Text("kuc@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColor.white),),
      trailing: IconButton(onPressed: () => Get.to(const ProfileScreen()), icon: const Icon(Iconsax.edit, color: TColor.white,),),
    );
  }
}