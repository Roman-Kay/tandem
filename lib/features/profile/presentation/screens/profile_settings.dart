import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:tandem/core/presentation/widgets/app_primary_button.dart';
import 'package:tandem/core/presentation/widgets/custom_thumb.dart';
import 'package:tandem/core/presentation/widgets/interest_button.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';
import 'package:tandem/features/home/presentation/models/interest_button_ui_model.dart';
import 'package:tandem/features/profile/presentation/components/custom_range_slider.dart';
import 'package:tandem/features/profile/presentation/components/gradient_rect_slider_track_shape.dart';
import 'package:tandem/features/profile/presentation/components/interests_list.dart';
import 'package:tandem/features/profile/presentation/components/switcher_button.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  List<InterestButtonUiModel> listOfbuttons1 = [
    InterestButtonUiModel(title: 'Страсть', icon: 'assets/images/flame.png'),
    InterestButtonUiModel(title: 'Вечеринка', icon: 'assets/images/drink.png'),

    InterestButtonUiModel(title: 'Семья', icon: 'assets/images/angel.png'),
    InterestButtonUiModel(title: 'Игры', icon: 'assets/images/game.png'),
  ];

  List<InterestButtonUiModel> listOfbuttons2 = [
    InterestButtonUiModel(title: 'Творчество', icon: 'assets/images/palete.png'),
    InterestButtonUiModel(title: 'Развитие', icon: 'assets/images/butterfly.png'),

    InterestButtonUiModel(title: 'Бизнес', icon: 'assets/images/mony.png'),
    InterestButtonUiModel(title: 'Технологии1', icon: 'assets/images/bantery.png'),

  ];

  List<InterestButtonUiModel> listOfbuttons3 = [
    InterestButtonUiModel(title: 'Бизнес', icon: 'assets/images/mony.png'),
    InterestButtonUiModel(title: 'Технологии1', icon: 'assets/images/bantery.png'),

    InterestButtonUiModel(title: 'Творчество', icon: 'assets/images/palete.png'),
    InterestButtonUiModel(title: 'Развитие', icon: 'assets/images/butterfly.png'),

  ];

  List<InterestButtonUiModel> listOfbuttons4 = [
    InterestButtonUiModel(title: 'Семья', icon: 'assets/images/angel.png'),
    InterestButtonUiModel(title: 'Игры', icon: 'assets/images/game.png'),

    InterestButtonUiModel(title: 'Страсть', icon: 'assets/images/flame.png'),
    InterestButtonUiModel(title: 'Вечеринка', icon: 'assets/images/drink.png'),
  ];




  List<InterestButtonUiModel> buttons2 = [
    InterestButtonUiModel(title: 'Поделиться историей ', icon: 'assets/images/bird.png'),
    InterestButtonUiModel(title: 'Обменяться подарками', icon: 'assets/images/edinorog.png'),

    InterestButtonUiModel(title: 'Приключение', icon: 'assets/images/ship.png'),
    InterestButtonUiModel(title: 'Совместный Chill', icon: 'assets/images/bech.png'),


  ];


  var selectedListGroup1 = <int>[];
  var selectedListGroup2 = <int>[];
  var selectedListGroup3 = <int>[];
  var selectedListGroup4 = <int>[];

  var selectedGroup2 = <int>[];

  var valR = 0.0;


  Alignment _alignment = Alignment.center;
  String slideCursorTitle = 'Все';

  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  RangeValues _currentRangeValues =   RangeValues(21, 34);

  String _getDateName(double val){
     int age = val.round();
     String txt;
      double count = age % 100;
      if (count >= 5 && count <= 20) {
        txt = 'лет';
      } else {
        count = count % 10;
        if (count == 1) {
          txt = 'год';
        } else if (count >= 2 && count <= 4) {
          txt = 'года';
        } else {
          txt = 'лет';
        }
      }
      return txt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: appColors.white,
        title: Text(
          'Tandem',
          style: appTextStyles.t1
              .copyWith(fontSize: 20,
              color: appColors.black),),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                    const SizedBox(height: 24),

                    /// switcher
                    Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          height: 45,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: appColors.gray3.withOpacity(0.12),
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                    ),
                                    height: 33,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SwitcherButton(
                                            title: 'Парни',
                                            onTap: (){
                                              setState(() {
                                                _alignment = Alignment.centerLeft;
                                                slideCursorTitle = 'Парни';
                                              });
                                            },
                                            color: appColors.primary,
                                          ),
                                        ),

                                        Expanded(
                                          child: SwitcherButton(
                                            title: 'Все',
                                            onTap: (){
                                              setState(() {
                                                _alignment = Alignment.center;
                                                slideCursorTitle = 'Все';
                                              });
                                            },
                                            color: appColors.primary,
                                          ),
                                        ),


                                        Expanded(
                                          child: SwitcherButton(
                                            title: 'Девушки',
                                            onTap: (){
                                              setState(() {
                                                _alignment = Alignment.centerRight;
                                                slideCursorTitle = 'Девушки';
                                              });
                                            },
                                            color: appColors.secondary,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AnimatedContainer (
                                    duration: Duration(milliseconds: 300),
                                    alignment: _alignment,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.3,
                                      child: Container(
                                        alignment: Alignment.center,
                                        // width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            gradient:
                                            LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors:
                                                [
                                                  appColors.secondary,
                                                  appColors.primary,
                                                ]
                                            )
                                        ),

                                        child: Text(slideCursorTitle,
                                            style: appTextStyles.b1
                                                .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: appColors.white)
                                        ),


                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),

                    /// slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_currentRangeValues.start.round()} ${_getDateName( _currentRangeValues.start)}',
                              style: appTextStyles.b1
                                  .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: appColors.primary)
                          ),
                          Text('${_currentRangeValues.end.round()}  ${_getDateName( _currentRangeValues.end)}',
                              style: appTextStyles.b1
                                  .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: appColors.secondary)
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: appColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: appColors.gray3.withOpacity(0.12),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackShape: GradientRectSliderTrackShape(),
                            thumbColor:  appColors.tertiary,
                            trackHeight: 10,
                            // overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                            thumbShape: CustomRoundSliderThumbShape(
                                disabledThumbRadius: 40,
                                enabledThumbRadius: 70),
                            // thumbShape: SliderComponentShape()
                            // thumbSelector:
                          ),
                          child:
                          CustomRangeSlider(
                            // RangeSlider(
                            max: 50,
                            min: 18,

                            // value: _currentRangeValues,
                            onChanged: (val) {
                              setState(() {
                                _currentRangeValues = val;
                              });
                            }, values: _currentRangeValues,
                          ),

                        ),
                      ],
                    ),
                    const SizedBox(height: 24),


                    /// buttons 1
                    InterestsList(
                      buttons: listOfbuttons1,
                      selectedGroup1: selectedListGroup1,
                      onTap:       (int index){
                        setState(() {
                          if(selectedListGroup1.contains(index-1) == false){
                            selectedListGroup1.add(index-1);
                          } else {
                            selectedListGroup1.removeWhere((item) => item == index-1);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    /// buttons 2
                    InterestsList(
                      buttons: listOfbuttons2,
                      selectedGroup1: selectedListGroup2,
                      onTap:       (int index){
                        setState(() {
                          if(selectedListGroup2.contains(index-1) == false){
                            selectedListGroup2.add(index-1);
                          } else {
                            selectedListGroup2.removeWhere((item) => item == index-1);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    /// buttons 3
                    InterestsList(
                      buttons: listOfbuttons3,
                      selectedGroup1: selectedListGroup3,
                      onTap:       (int index){
                        setState(() {
                          if(selectedListGroup3.contains(index-1) == false){
                            selectedListGroup3.add(index-1);
                          } else {
                            selectedListGroup3.removeWhere((item) => item == index-1);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    /// buttons 4
                    InterestsList(
                      buttons: listOfbuttons4,
                      selectedGroup1: selectedListGroup4,
                      onTap:       (int index){
                        setState(() {
                          if(selectedListGroup4.contains(index-1) == false){
                            selectedListGroup4.add(index-1);
                          } else {
                            selectedListGroup4.removeWhere((item) => item == index-1);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20),


                    /// intersts group 2
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index){
                            return  const SizedBox(height: 20);
                          },
                          itemCount: buttons2.length,
                          itemBuilder: (BuildContext context, int index){
                            return

                              InterestButton.altType2(
                                  onTap: (){
                                    setState(() {
                                      if(selectedGroup2.contains(index) == false){
                                        selectedGroup2.add(index);
                                      } else {
                                        selectedGroup2.removeWhere((item) => item  == index);
                                      }

                                    });
                                  },
                                  isActive: selectedGroup2.contains(index),
                                  buttonUiModel:
                                  buttons2[index],
                                  altType: true);

                          }),
                    ),
                  ],
                ),

                // Expanded(child: const SizedBox( ))

                const SizedBox( height: 56 + 16*2,)
              ],
            ),
          ),


          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        height: 56,
                        child: AppPrimaryButton(value: 'Применить', onTap: () {  },)),
                  )))
        ],

      ),
    );
  }
}

