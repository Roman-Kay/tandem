import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  AppPrimaryButton(
      {this.value,
      required this.onTap,
      this.bgColor,
      this.child,
      this.gradientType = 0,
      Key? key})
      : super(key: key) {
    if (bgColor == null) {
      bgColor = appColors.primary;
    }

    valueColor = appColors.white;
  }

  Color? bgColor;
  String? value;
  Widget? child;
  Function() onTap;
  Color? valueColor;
  int gradientType;

  Widget _buildLabel() {
    return child ??
        Baseline(
          baseline: 17,
          baselineType: TextBaseline.alphabetic,
          child: Text(value!,
              style: appTextStyles.t1.copyWith(
                  color: appColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center),
        );
  }

  @override
  Widget build(BuildContext context) {
    // IntrinsicWidth

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
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
        color: onTap == null ? bgColor!.withOpacity(0.3) : bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: SizedBox(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 11, bottom: 11, right: 20, left: 20),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 88.0,
                  ),
                  child: Center(child: _buildLabel())),
            ),
          ),
        ),
      ),
    );
  }
}
