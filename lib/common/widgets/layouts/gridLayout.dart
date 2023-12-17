import 'package:flutter/material.dart';

import '../../../utils/constant/sizes.dart';

class TGridViewLayout extends StatelessWidget {
  const TGridViewLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtend = 288,
      required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtend;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSize.gribViewSpacing,
        crossAxisSpacing: TSize.gribViewSpacing,
        mainAxisExtent: mainAxisExtend,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
