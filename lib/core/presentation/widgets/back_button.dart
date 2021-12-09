import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: InkResponse(
          radius: 25,
          splashColor:  appColors.gray2.withOpacity(0.4),
          highlightColor: appColors.gray2.withOpacity(0.2),
          onTap: onTap,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child:
              SvgPicture.asset(
                  'assets/vector/star_ins.svg',
                  color: appColors.primary)
          ),
        ),
      ),
    );
  }
}
