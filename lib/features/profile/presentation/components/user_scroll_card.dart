import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tandem/core/presentation/widgets/custom_tab_page_selector.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tandem/features/home/domen/models/user_model.dart';
import 'package:tandem/features/home/presentation/models/interest_button_ui_model.dart';
import 'package:tandem/features/profile/presentation/screens/profile_settings.dart';
import '../../../../core/presentation/widgets/interest_button_alt.dart';

class UserScrollCard extends StatefulWidget {
  const UserScrollCard({
    required this.userModel,
    Key? key}) : super(key: key);

  final UserModel userModel;

  @override
  State<UserScrollCard> createState() => _UserScrollCardState();
}

class _UserScrollCardState extends State<UserScrollCard> with SingleTickerProviderStateMixin{

  List<InterestButtonUiModel> buttons = [
    InterestButtonUiModel(title: 'Интересы', icon: 'assets/images/rainbow.png'),
    InterestButtonUiModel(title: 'Игры', icon: 'assets/images/game.png'),
    InterestButtonUiModel(title: 'Страсть', icon: 'assets/images/hart.png'),
    InterestButtonUiModel(title: 'Горячее общение', icon: 'assets/images/flame.png'),
    InterestButtonUiModel(title: 'Вечеринка', icon: 'assets/images/drink.png'),
    InterestButtonUiModel(title: 'Развитие', icon: 'assets/images/butterfly.png'),
  ];

  int selectedButton = 0;

  List<String> photos = [
    'assets/images/test_img.png',
    'assets/images/test_img_7.png',
    'assets/images/test_img_4.png'
  ];

  ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  late PreloadPageController _pageController = PreloadPageController(initialPage: 0);


  @override
  void initState() {
    _tabController = TabController(vsync: this, length: photos.length);
    _scrollController.addListener(() {
      var step = 1046/photos.length;
      int page =  (_scrollController.offset / step).round();
      var k =_scrollController.position.maxScrollExtent;
    });

    super.initState();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        /// photo bg
        Container(

          child:
          PreloadPageView.builder(
              onPageChanged: (int page) {
                setState(() {
                  _tabController.animateTo(page);
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: widget.userModel.photos.length,
              preloadPagesCount: 3,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index){
                return  Image.asset(
                    widget.userModel.photos[index],
                    fit: BoxFit.cover);
              }),
        ),




        /// user description
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/vector/star_ins.svg'),
                              const SizedBox(width: 12),
                              RichText(
                                text: TextSpan(
                                  text: widget.userModel.name,
                                  style: appTextStyles.headline5
                                      .copyWith(
                                      color: appColors.white,
                                      fontSize: 25),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.userModel.age,
                                      style: appTextStyles.headline5
                                          .copyWith(
                                          color: appColors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          /// city
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.userModel.city,
                                style: appTextStyles.t1
                                    .copyWith(
                                    color: appColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          /// user description
                          const SizedBox(height: 12),
                          Text(
                            widget.userModel.description,
                            style: appTextStyles.b1
                                .copyWith(
                                color: appColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      Positioned.fill(
                        top: 10,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset('assets/vector/star_per.svg')),
                      ),
                    ],
                  )
                ),

                /// carousel
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.userModel.interests.length + 2,
                      separatorBuilder: (BuildContext context, int index){
                        return  const SizedBox(width: 12);},
                      itemBuilder: (BuildContext context, int index){
                        if(index == 0 ||  index == widget.userModel.interests.length + 1){
                          return const SizedBox(width: 12);}
                        else  { return GestureDetector(
                          onTap: (){
                            if(index - 1 == 0){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileSettings()));
                            }
                          },
                          child: InterestButtonAlt(
                            isActive: selectedButton == index -1,
                            title: widget.userModel.interests[index-1],
                          ),
                        );}
                      }),
                ),

                const SizedBox(height: 36),
              ],
            ),
          ),
        ),

        /// app bar
        Positioned.fill(
          top: topPadding,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: size.height * 0.08,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPageSelector(
                      indicatorWidth: size.width * 0.075 ,
                      selectedColor: appColors.white,
                      color: appColors.white.withOpacity(0.35),
                      controller: _tabController,
                      indicatorSize: 11.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
