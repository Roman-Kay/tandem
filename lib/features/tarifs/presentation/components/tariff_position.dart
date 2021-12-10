import 'package:flutter/material.dart';

import 'package:tandem/core/utils/colors_config/app_colors_config.dart';

class TariffPosition extends StatefulWidget {
  final int type;

  const TariffPosition({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  _TariffPositionState createState() => _TariffPositionState();
}

class _TariffPositionState extends State<TariffPosition> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 56,
              height: 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.gray4,
              ),
            ),
            Container(
              width: 56,
              height: 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.gray4,
              ),
            ),
            Container(
              width: 56,
              height: 11,
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
        alignment: widget.type == 1
            ? Alignment.centerLeft
            : widget.type == 2
                ? Alignment.center
                : Alignment.centerRight,
        child: Container(
          width: 56,
          height: 11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appColors.gray4,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: widget.type == 1
                    ? [appColors.pink, appColors.orange]
                    : widget.type == 2
                        ? [appColors.green, appColors.blue1]
                        : [appColors.blue2, appColors.pink]),
          ),
        ),
      ),
    ]);
  }
}
