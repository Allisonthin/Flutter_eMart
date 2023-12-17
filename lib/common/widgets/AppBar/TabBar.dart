import 'package:e_mart/utils/device/device_utilities.dart';
import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget{
  /// if we want to add background color to tabs we have to wrap them in material widgets
  /// to do that  we need [preferredSized] widged and that's why we created custom class. [preferredSizedWidget]
  const TTabBar({super.key, required this.tabs});

  final List<Widget>  tabs;

  @override
  Widget build(BuildContext context) {
    final dark  =THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? TColor.black : TColor.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColor.primary,
        labelColor: dark ? TColor.white : TColor.primary,
        unselectedLabelColor: TColor.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
