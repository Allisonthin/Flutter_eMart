import 'package:e_mart/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/text_string.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColor.darkGrey : TColor.grey,
            height: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TColor.darkGrey : TColor.grey,
            height: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
