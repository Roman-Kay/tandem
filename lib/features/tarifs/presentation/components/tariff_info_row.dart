import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class TariffInfoRow extends StatelessWidget {
  const TariffInfoRow({
    required this.title,
    required this.subTitle,
    required this.type,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final int type;

  String _getIcon(int type) {
    if (type == 1) {
      return 'assets/vector/check_buble_1.svg';
    } else if (type == 2) {
      return 'assets/vector/check_buble_2.svg';
    } else {
      return 'assets/vector/check_buble_3.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(_getIcon(type)),
        const SizedBox(width: 16),
        RichText(
          // textAlign: TextAlign.center,
          text: TextSpan(
            text: title,
            style: appTextStyles.body2.copyWith(color: appColors.black),
            children: <TextSpan>[
              TextSpan(
                text: '\n$subTitle',
                style: appTextStyles.body2.copyWith(
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: appColors.black.withOpacity(0.25)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
