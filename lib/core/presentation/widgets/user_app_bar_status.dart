import 'package:flutter/material.dart';
import 'package:tandem/core/presentation/widgets/avatar_widget.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class UserAppBarStatus extends StatelessWidget {
  const UserAppBarStatus({
    required this.name,
    required this.isOnline,
    Key? key,
  }) : super(key: key);

  final String name;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        AvatarWidget(size: 40, avatar: 'assets/images/user_1.png'),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(name,
                style: appTextStyles.body1
                    .copyWith(
                    height: 1,
                    fontSize: 15)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                    isOnline
                      ? 'Сейчас в сети'
                      : 'Не всети',
                    style: appTextStyles.body2
                    .copyWith(
                    color: appColors.black.withOpacity(0.25),
                    fontSize: 13,
                    height: 1,
                    fontWeight: FontWeight.w400)),
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: appColors.white, width: 2),
                      color:
                      isOnline
                        ? appColors.success
                        : appColors.errors,
                      shape: BoxShape.circle
                  ),
                ),

              ],
            ),
          ],
        )
      ],

    );
  }
}