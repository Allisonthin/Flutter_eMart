import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/features/personalisation/controller/update_name_controller.dart';
import 'package:e_mart/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_string.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall,),

      ),
      body: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // heading
            Text("Use your real name for easy verification. This name will appear in several pages.",
            style: Theme.of(context).textTheme.labelMedium,),

            const SizedBox(height: TSize.spaceBtwSections,),

            // textfield and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSize.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSize.spaceBtwInputFields,),

                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBtwSections,),

            SizedBox(width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.updateUserName(),
              child: const Text("Save"),
            ),
            )
          ],
        ),
      ),
    );
  }
}
