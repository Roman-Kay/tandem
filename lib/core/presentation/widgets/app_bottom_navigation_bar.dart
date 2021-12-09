import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'app_navigation_bar_icon_button.dart';
import 'avatar_widget.dart';


class AppBottomNavigationBar extends StatefulWidget {

  final ValueChanged<int> onTap;

  AppBottomNavigationBar({
    required this.onTap,
  });

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> with SingleTickerProviderStateMixin {

  Alignment _alignment = Alignment(-1.0, 0.0);
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  bool isTapped = false;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    final markerWidth = 50.0;

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _sizeAnimation = TweenSequence(

        <TweenSequenceItem<double>>[

          TweenSequenceItem<double>(
            tween: Tween<double>(begin: markerWidth, end: 10),
            weight: 50,
          ),

          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 10, end: markerWidth),
            weight: 50,

          ),
        ]
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          isTapped  = true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState(() {
          isTapped  = false;
        });
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void changeSelectedTab({required Alignment alignment, required int index}){

    setState(() {
      _alignment = alignment;
      selectedTab = index;
      isTapped ?  _controller.reverse() : _controller.forward();
      widget.onTap(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appColors.white,
      ),
      height: 72,
      child:
      Column(
        children: [
          /// buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// catalog button
                AppNavigationBarIconButton(
                  buttonSize: 70,
                  onPressed: (){
                    changeSelectedTab(
                        alignment: const Alignment(-1.0, 0.0),
                        index: 0
                    );
                  },
                  icon: Image.asset('assets/images/navigation_tab_1.png'),
                  iconSize: 37,
                  iconColor: switchColor(0, selectedTab),
                  // title: 'Каталог',
                 ),

                /// rewards button
                AppNavigationBarIconButton(
                  buttonSize: 70,
                  onPressed: (){
                    changeSelectedTab(
                        alignment: const Alignment(0.0, 0.0),
                        index: 1
                    );
                  },
                  icon: Image.asset('assets/images/navigation_tab_2.png'),
                  iconSize: 32,
                  iconColor: switchColor(1, selectedTab),
                  // title: 'Таблицы',
                ),

                /// notification button
                AppNavigationBarIconButton(
                  buttonSize: 70,
                  onPressed: (){
                    changeSelectedTab(
                        alignment: const Alignment(-0.5, 0.0),
                        index: 2
                    );
                  },
                  icon: AvatarWidget(size: 40, avatar: 'assets/images/user_1.png'),
                  iconSize: 30,
                  iconColor: switchColor(2, selectedTab),
                 ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Color switchColor(int index, int currentIndex) {
    if (currentIndex == index) {
      return appColors.primary;
    } else {
      return appColors.typographyHint;
    }
  }
}