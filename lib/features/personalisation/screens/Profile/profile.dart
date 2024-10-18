import 'dart:ffi';

import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/common/widgets/images/t_circular_image.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/personalisation/screens/Profile/widgets/name_change.dart';
import 'package:e_mart/features/personalisation/screens/Profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/constant/text_string.dart';
import '../../controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("My Profile"),
      ),

      /// body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx((){
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : TImages.profileImage;
                    return TCircularImage(image: image, width: 80, height: 80,);}),
                  TextButton(onPressed: () => controller.updateUserProfilePicture(), child: const Text(TTexts.profileImageChange)),
                ],
              ),
            ),
            /// details
            const SizedBox(height: TSize.spaceBtwItems / 2,),
            const Divider(),
            const SizedBox(height: TSize.spaceBtwItems,),

            /// heading profile Information
            const TSectionHeading(title: "Profile Information", showActionButton: false,),
            const SizedBox(height: TSize.spaceBtwItems,),

            TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(()=> const ChangeName()),),
            TProfileMenu(title: 'Username', value: controller.user.value.userName, onPressed: () {  },),

            const SizedBox(height: TSize.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: TSize.spaceBtwItems,),

            /// heading personal Information
            const TSectionHeading(title: "Personal Information", showActionButton: false,),
            const SizedBox(height: TSize.spaceBtwItems,),

            TProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () {  },),
            TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {  },),
            TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {  },),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {  },),
            TProfileMenu(title: 'Date of Birth', value: '10 oct, 2000', onPressed: () {  },),

            const Divider(),
            const SizedBox(height: TSize.spaceBtwItems,),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text("Close Account"),
              ),
            )


          ],
        ),),
      ),
    );
  }
}


