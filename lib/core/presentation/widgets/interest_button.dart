import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';
import 'package:tandem/features/home/presentation/models/interest_button_ui_model.dart';

class InterestButton extends StatelessWidget {
    InterestButton({
    required this.buttonUiModel,
    this.isActive = false,
    this.altType = false,
    this.onTap,
    Key? key,
    }) : colorsSet = colors,
          super(key: key);

    InterestButton.altType({
    required this.buttonUiModel,
    this.isActive = false,
    this.altType = true,
    this.onTap,
    Key? key,
  }) : colorsSet = colorsAlt1,
       super(key: key);

    InterestButton.altType2({
    required this.buttonUiModel,
    this.isActive = false,
    this.altType = true,
    this.onTap,
    Key? key,
  }) : colorsSet = colorsAlt2,
        super(key: key);

  static const List<Color> colors = [Color(0xFFFF8BAD), Color(0xFF7FBBFB)];
  static const List<Color> colorsAlt1 = [Color(0xFF7FBBFB), Color(0xFF9586FD)];
  static const List<Color> colorsAlt2 = [Color(0xFFFF8BAD), Color(0xFF9586FD)];

  final InterestButtonUiModel buttonUiModel;
  final bool isActive;
  final bool altType;
  final Function()? onTap;
     List<Color>? colorsSet;


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),

          boxShadow: altType
          ? [
            BoxShadow(
              color: appColors.gray3.withOpacity(0.12),
              offset: const Offset(0.0, 0.0),
              blurRadius: 10.0,
            ),
          ]
          : null,

          gradient:
          isActive
              ? LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: colorsSet!
          )
              : null,
          color: isActive
              ? null
              : altType ? appColors.white :  appColors.white.withOpacity(0.2)
      ),
      child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            // radius: 25,
            // splashColor: AppColors.gray2.withOpacity(0.4),
            // highlightColor: AppColors.gray2.withOpacity(0.2),
            onTap: onTap,
            child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(buttonUiModel.icon),
                    const SizedBox(width: 12),
                    Text(
                      buttonUiModel.title,
                      style: appTextStyles.b1
                          .copyWith(
                          fontWeight: FontWeight.w500,
                          color:
                          isActive
                              ? appColors.white
                          : altType
                          ? appColors.tertiary
                          : appColors.white
                      ),
                    ),
                  ],
                )
            ),
          )),
    );
  }
}