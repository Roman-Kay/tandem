import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class AvatarWidget extends StatelessWidget {
    AvatarWidget({
    required this.size,
    required this.avatar,
    this.online,
    this.number,
    this.border,
    Key? key}) : super(key: key);

  final double size;
  final String avatar;
  final String? number;
  final bool? online;
  final bool? border;


  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );
// border for all 3 colors
  var kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
    border: Border.all(
      color: Colors.amber, //kHintColor, so this should be changed?
    ),
    borderRadius: BorderRadius.circular(32),
  );

  @override
  Widget build(BuildContext context) {
    return  /// avatar
      SizedBox(
        width: size,
        height: size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // if(border == true)
              Align(
                alignment: Alignment.center,
              child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [appColors.primary, appColors.secondary]
                    ),
                  )

              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                width: border == true ? size -8 : size,
                height: border == true ? size -8 : size,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(avatar),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle
                ),

        ),
              ),
            ),


            if(online == true)
                  Positioned.fill(
                    bottom: -10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
              // margin: EdgeInsets.only(bottom: 10),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                      border: Border.all(
                          color: appColors.white,
                          width: 4),
                      color: appColors.success,
                      shape: BoxShape.circle
              ),
            ),
                    ),
                  ),

            if(number != null)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: appColors.primary.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                    child: Text(number!,
                      style: appTextStyles.headline4
                          .copyWith(
                          color: appColors.white,
                          fontSize: 29,
                        fontWeight: FontWeight.w900

                      ),),
                  ),
                ),
              )
          ],
        ),
      );
  }
}
