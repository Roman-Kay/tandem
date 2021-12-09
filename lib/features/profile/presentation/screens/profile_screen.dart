import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';
import 'package:tandem/features/home/domen/models/test_users.dart';
import 'package:tandem/features/profile/presentation/components/percent_button.dart';
import 'package:tandem/features/profile/presentation/components/user_scroll_card.dart';
import 'package:tandem/features/profile/presentation/screens/profile_settings.dart';
import 'package:tandem/features/tarifs/presentation/screens/tarif_screen.dart';
import 'compatibility_screen.dart';


class ProfileScreen extends StatefulWidget {
    ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{

  int freePeriod = 5;
  int usePeriod = 0;

  @override
  Widget build(BuildContext context) {

    final topPadding = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: appColors.white,
      body:  ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0)
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              // height: 500,
              child:

              /// users list
              PageView.builder(
                  onPageChanged: (int page) {
                    setState(() {
                      // _tabController.animateTo(page);
                    });
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: 7,
                  // controller: _pageController,
                  itemBuilder: (BuildContext context, int index){
                    return  UserScrollCard(userModel: testUsers[index]);
                  }),
            ),


            /// photo placer
            if(1 == 2)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SvgPicture.asset('assets/vector/photo_place.svg'),
                const SizedBox(height: 24),

                RichText(
                  text: TextSpan(
                    text: 'Tandem',
                    style: appTextStyles.body1
                        .copyWith(
                        color: appColors.white,
                        fontSize: 17),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Фотокарточки',
                        style: appTextStyles.body1
                            .copyWith(
                            color: appColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
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
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkResponse(
                                splashColor: Colors.white,
                                child:  const PercentButton(percent: 48),
                                onTap: () {
                                  usePeriod = usePeriod + 1;
                                  if(usePeriod < freePeriod){
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) => CompatibilityScreen()));
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) => TariffScreen()));
                                  }

                                },
                              ),
                            )
                        ),

                        Material(
                          shape: CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child:

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkResponse(
                                splashColor: Colors.white,
                                child: SvgPicture.asset('assets/vector/settings_icon.svg'),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileSettings()));
                                },
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



