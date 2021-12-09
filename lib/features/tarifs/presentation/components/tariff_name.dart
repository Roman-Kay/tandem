import 'package:flutter/material.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class TariffName extends StatelessWidget {
  const TariffName({
    required this.type,
    Key? key,
  }) : super(key: key);

  final int type;

  String _getText(int type) {
    if (type == 1) {
      return ' PLUS';
    } else if (type == 2) {
      return ' OPTIMA';
    } else {
      return ' MAX';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Tandem',
                  style: appTextStyles.headline5
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                  children: <TextSpan>[
                    TextSpan(
                      text: (_getText(type)),
                      style: appTextStyles.headline5
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.transparent),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
