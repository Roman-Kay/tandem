import 'package:flutter/cupertino.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class SwitcherButton extends StatelessWidget {
  const SwitcherButton({
    required this.onTap,
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  final Function() onTap;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 33,
            alignment: Alignment.center,
            child: Text(title,
                style: appTextStyles.b1
                    .copyWith(fontWeight: FontWeight.w500, color: color))));
  }
}
