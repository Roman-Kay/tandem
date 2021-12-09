import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class CompatibilityCard extends StatelessWidget {
  const CompatibilityCard({
    required this.percent,
    required this.title,
    Key? key,
  }) : super(key: key);

  final double percent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [appColors.primary, appColors.secondary]
          ),
          boxShadow: [
            BoxShadow(
              color: appColors.gray3.withOpacity(0.12),
              offset: const Offset(0.0, 0.0),
              blurRadius: 10.0,
            ),
          ],
          borderRadius:   BorderRadius.circular(40)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Baseline(
            baseline: 14,
            baselineType: TextBaseline.alphabetic,
            child: Text(title,
              style: appTextStyles.body1.copyWith(
                  color: appColors.white,
                  fontWeight: FontWeight.w500
              )),
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Stack(
                  children: [
                    Container(
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius:   BorderRadius.circular(40)
                      ),
                    ),

                    FractionallySizedBox(
                      widthFactor: percent /100,
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:   BorderRadius.circular(40)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              Baseline(
                baseline: 14,
                baselineType: TextBaseline.alphabetic,
                child: Text('${percent.round()}%',
                    style: appTextStyles.body1.copyWith(
                        color: appColors.white,
                        fontWeight: FontWeight.w500
                    )),
              ),
            ],
          )

        ],
      ),
    );
  }
}