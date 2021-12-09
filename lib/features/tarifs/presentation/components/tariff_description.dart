import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tandem/core/presentation/widgets/app_primary_button.dart';
import 'package:tandem/features/tarifs/presentation/components/tariff_info_row.dart';
import 'dart:io' show Platform;

class TariffDescription extends StatelessWidget {
  const TariffDescription({
    required this.type,
    Key? key,
  }) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// info rows
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
          child: Column(
            children: [
              TariffInfoRow(
                title: 'Безлимитный Tandem',
                subTitle: 'Знакомься и создавай тандемы',
                type: type,
              ),
              const SizedBox(height: 16),
              TariffInfoRow(
                title: 'Максимальное взаимодействие',
                subTitle: 'Больше возможностей',
                type: type,
              ),
              const SizedBox(height: 16),
              TariffInfoRow(
                title: 'Статус верификации  🔱',
                subTitle: 'Награждаем привелегиями',
                type: type,
              ),
              const SizedBox(height: 16),
              TariffInfoRow(
                title: 'Совместимость',
                subTitle: 'Найди родную душу',
                type: type,
              ),
            ],
          ),
        ),

        /// button
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppPrimaryButton(
            child: SvgPicture.asset(Platform.isIOS
                ? 'assets/vector/apple_pay_logo.svg'
                : 'assets/vector/google_play_logo.svg'),
            gradientType: type,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
