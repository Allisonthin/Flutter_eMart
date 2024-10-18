import 'package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/Product/sortable/sortable_product.dart';
import '../../../../utils/constant/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Popular Products",),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}


