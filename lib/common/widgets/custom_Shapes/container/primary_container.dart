import 'package:flutter/material.dart';

import '../../../../utils/constant/colors.dart';
import '../curved_edge/curved_edge_widget.dart';
import 'circular_container.dart';



class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColor.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top : -10,
              right: -150,
              child: TCircularContainer(
                width: 300,
                height: 300,
                radius: 300,
                background: TColor.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -150,
              child: TCircularContainer(
                width: 300,
                height: 300,
                radius: 300,
                background: TColor.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
