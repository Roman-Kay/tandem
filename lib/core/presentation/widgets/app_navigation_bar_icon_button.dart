import 'package:flutter/material.dart';
import 'animated_color_icon.dart';

class AppNavigationBarIconButton extends StatelessWidget {

  final VoidCallback onPressed;
  final double buttonSize;
  final Widget icon;
  final double iconSize;
  final Color iconColor;

  AppNavigationBarIconButton({
        required this.buttonSize,
        required this.icon,
        required this.iconColor,
        required this.iconSize,
        required this.onPressed
      })
      : assert(buttonSize != null),
        assert(icon != null),
        assert(iconColor != null),
        assert(iconSize != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints:
      BoxConstraints.tightFor(height: buttonSize, width: buttonSize),
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      child: AnimatedColorIcon(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon(context),
          ],
        ),
        size: iconSize,
        color: iconColor,
        duration: Duration(milliseconds: 400), onEnd: () {  },
      ),
    );
  }

  Widget buttonIcon(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon
      ],
    );
  }
}
