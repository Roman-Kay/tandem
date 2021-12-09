import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class TariffCard extends StatelessWidget {
  const TariffCard({
    required this.icon,
    required this.price,
    required this.newPrice,
    required this.period,
    Key? key,
  }) : super(key: key);

  final String period;
  final String price;
  final String newPrice;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.passthrough,
      children: [
        Positioned.fill(
            child: Align(
          child: Container(
              width: 700,
              // color: Colors.cyan,
              child: SizedBox(width: 700, child: SvgPicture.asset(icon))),
        )

            // Expanded(child: SvgPicture.asset(icon)),
            ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: period,
                style: appTextStyles.headline3.copyWith(color: appColors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n$newPrice',
                    style: appTextStyles.headline3
                        .copyWith(height: 1.2, color: appColors.white),
                  ),
                  TextSpan(
                    text: '\n$price',
                    style: appTextStyles.headline5.copyWith(
                        decoration: TextDecoration.lineThrough,
                        height: 2.1,
                        fontWeight: FontWeight.w400,
                        color: appColors.white.withOpacity(0.4)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
