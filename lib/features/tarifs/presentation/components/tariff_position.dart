import 'package:flutter/material.dart';

import 'package:tandem/core/utils/colors_config/app_colors_config.dart';

class TariffPosition extends StatefulWidget {
  final double width;
  final double height;

  final int currentIndex;

  const TariffPosition(
      {Key? key,
      required this.width,
      required this.height,
      required this.currentIndex,
      r})
      : super(key: key);

  set gradientType(int gradientType) {}

  @override
  _TariffPositionState createState() =>
      _TariffPositionState(this.gradientType = 0);
}

class _TariffPositionState extends State<TariffPosition> {
  final int gradientType;

  _TariffPositionState(this.gradientType);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.gray4,
              ),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.gray4,
              ),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.gray4,
              ),
            )
          ],
        ),
      ),
      AnimatedAlign(
        duration: const Duration(milliseconds: 150),
        alignment: gradientType == 0
            ? Alignment.centerLeft
            : gradientType == 1
                ? Alignment.center
                : Alignment.centerRight,
        child: Container(
          width: widget.width,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appColors.gray4,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: gradientType == 0
                    ? [appColors.tertiary, appColors.primary]
                    : gradientType == 1
                        ? [appColors.pink, appColors.orange]
                        : gradientType == 2
                            ? [appColors.green, appColors.blue1]
                            : [appColors.blue2, appColors.pink]),
          ),
        ),
      ),
    ]);
  }
}
