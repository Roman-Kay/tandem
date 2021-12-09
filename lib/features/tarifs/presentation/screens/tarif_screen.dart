import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';
import 'package:tandem/features/home/presentation/models/interest_button_ui_model.dart';
// import 'package:tandem/features/tarifs/presentation/components/custom_tab_page_selector.dart';
import 'package:tandem/features/tarifs/presentation/components/tariff_card.dart';
import 'package:tandem/features/tarifs/presentation/components/tariff_description.dart';
import 'package:tandem/features/tarifs/presentation/components/tariff_name.dart';
import 'package:tandem/features/tarifs/presentation/components/tariff_position.dart';

class TariffScreen extends StatefulWidget {
  const TariffScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TariffScreen> createState() => _TariffScreenState();
}

class _TariffScreenState extends State<TariffScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  late PageController _pageController = PageController(initialPage: 0);
  late int currentIndex;
  late Color stepsGradientStart;
  late Color stepsGradientEnd;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _scrollController.addListener(() {
      var k = _scrollController.position.maxScrollExtent;
      print('KK ${k}');
      // _tabController.animateTo(page);
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  List<InterestButtonUiModel> buttons = [
    InterestButtonUiModel(title: 'Страсть', icon: 'assets/images/flame.png'),
    InterestButtonUiModel(title: 'Вечеринка', icon: 'assets/images/drink.png'),
    InterestButtonUiModel(title: 'Семья', icon: 'assets/images/angel.png'),
    InterestButtonUiModel(title: 'Игры', icon: 'assets/images/game.png'),
    InterestButtonUiModel(
        title: 'Творчество', icon: 'assets/images/palete.png'),
    InterestButtonUiModel(
        title: 'Развитие', icon: 'assets/images/butterfly.png'),
    InterestButtonUiModel(title: 'Бизнес', icon: 'assets/images/mony.png'),
    InterestButtonUiModel(
        title: 'Технологии1', icon: 'assets/images/bantery.png'),
  ];

  List<InterestButtonUiModel> buttons2 = [
    InterestButtonUiModel(
        title: 'Поделиться историей ', icon: 'assets/images/bird.png'),
    InterestButtonUiModel(
        title: 'Обменяться подарками', icon: 'assets/images/edinorog.png'),
    InterestButtonUiModel(title: 'Приключение', icon: 'assets/images/ship.png'),
    InterestButtonUiModel(
        title: 'Совместный Chill', icon: 'assets/images/bech.png'),
  ];

  var selectedGroup1 = <int>[];
  var selectedGroup2 = <int>[];

  var valR = 0.0;

  Alignment _alignment = Alignment.center;
  String slideCursorTitle = 'Все';

  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  RangeValues _currentRangeValues = const RangeValues(21, 34);

  Widget _animatedWidget = TariffDescription(type: 1);

  Widget _animatedWidgetText = TariffName(type: 1);

  // Widget _animatedWidgetPosition = TariffPosition(type: 1);

  // String _getText(int type) {
  //   if (type == 1) {
  //     return ' PLUS';
  //   } else if (type == 2) {
  //     return ' OPTIMA';
  //   } else {
  //     return ' MAX';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: _animatedWidgetText,
                  ),
                  Expanded(
                    // flex: 46,
                    child: PageView(
                      onPageChanged: (int page) {
                        setState(() {
                          _tabController.animateTo(page);
                          // print(page);
                          _animatedWidget = TariffDescription(type: page + 1);
                          _animatedWidgetText = TariffName(type: page + 1);
                          //  _animatedWidgetPosition = TariffPosition(type: 1);
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: const [
                        TariffCard(
                            period: '1 Месяц',
                            price: '299 ₽',
                            newPrice: '179 ₽',
                            icon: 'assets/vector/1_month.svg'),
                        TariffCard(
                            period: '6 месяцев',
                            price: '899 ₽',
                            newPrice: '459 ₽',
                            icon: 'assets/vector/6_month.svg'),
                        TariffCard(
                            period: '1 год',
                            price: '1599 ₽',
                            newPrice: '759 ₽',
                            icon: 'assets/vector/1_year.svg'),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 139.0, right: 139.0),
                  //   child: TariffPosition(
                  //     width: (width - 290) / 3,
                  //     height: 7,
                  //     currentIndex: currentIndex,
                  //     colorStart: stepsGradientStart,
                  //     colorEnd: stepsGradientEnd,
                  //   ),
                  // ),
// TariffPosition(

// ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 1, bottom: 12),
                  //   child: CustomPageSelectorForTariff(
                  //     indicatorWidth: 56,
                  //     selectedColor: appColors.primary,
                  //     color: appColors.gray4,
                  //     controller: _tabController,
                  //     indicatorSize: 11.0,
                  //   ),
                  // ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: appColors.gray3.withOpacity(0.12),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: _animatedWidget,
                          ),
                          RichText(
                            // textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Подписка оформлена?',
                              style: appTextStyles.body2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: appColors.gray5),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Условия и Политика',
                                  style: appTextStyles.body2.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: appColors.gray5),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28)
                        ],
                      )

                      // TariffDescription(type: 3),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
