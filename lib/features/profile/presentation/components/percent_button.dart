import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class PercentButton extends StatelessWidget {
  const PercentButton({
    required this.percent,
    Key? key,
  }) : super(key: key);

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: appColors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(50),
      ),

      // width: 67,
      // height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Baseline(
        baseline: 20,
        baselineType: TextBaseline.alphabetic,
        child: Text('$percent%',
          style: appTextStyles.body1
              .copyWith(
              color: appColors.white,
              fontSize: 17),),
      ),
    );
  }
}
