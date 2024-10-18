import "package:e_mart/common/widgets/custom_Shapes/custom_appBar/TAppBar.dart";
import "package:e_mart/features/shop/screen/order/widgets/order_list.dart";
import "package:flutter/material.dart";

import "../../../../utils/constant/sizes.dart";

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("My Order", style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),

        /// order
        child: TOrderListItems(),
      ),
    );
  }
}
