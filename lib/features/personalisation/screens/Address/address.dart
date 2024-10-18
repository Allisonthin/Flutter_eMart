import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:e_mart/features/personalisation/screens/Address/add_new_address.dart';
import 'package:e_mart/features/personalisation/screens/Address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(const AddNewAddressScreen()),
          backgroundColor: TColor.primary,
          child: const Icon(Iconsax.add, color: TColor.white,),
        ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Address", style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: true),
            ],
          ),
        ),
      ),
    );
  }
}
