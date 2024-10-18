import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

/// widget for displaying an animated loading indicator with optional text and action button.
class TAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor  for TAnimationLoaderWidget.
  ///
  /// Parameters:
  /// - text : The text to be displayed below the animation.
  /// - animation : The path to the lotties animation file.
  /// - showAction : Whether to show an action button below the text.
  /// - actionText : The text to be display on the action button.
  /// - onActionPressed : callback function to be executed when the action button is pressed.
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8,
            height: MediaQuery.of(context).size.width *
          0.8

          ), // display lotties animation
          const SizedBox(
            height: TSize.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSize.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: TColor.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColor.light),
                    ),
                  ))
              : const SizedBox(
            width: TSize.defaultSpace,
            height: TSize.defaultSpace,
          ),
        ],
      ),
    );
  }
}
