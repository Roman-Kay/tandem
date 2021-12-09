import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tandem/core/presentation/widgets/avatar_widget.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
import 'package:tandem/core/utils/typography/app_text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({required this.tag, Key? key}) : super(key: key);

  final int tag;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: true,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Row(
              children: [
                Hero(
                    tag: 'img-$tag',
                    child: AvatarWidget(
                        size: 40, avatar: 'assets/images/user_1.png')),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Кристина',
                        style: appTextStyles.body1
                            .copyWith(height: 1, fontSize: 15)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(false ? 'Сейчас в сети' : 'Не всети',
                            style: appTextStyles.body2.copyWith(
                                color: appColors.black.withOpacity(0.25),
                                fontSize: 13,
                                height: 1,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(width: 10),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: appColors.white, width: 2),
                              color:
                                  false ? appColors.success : appColors.errors,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 12);
                    },
                    itemCount: 10 + 1,
                    itemBuilder: (BuildContext context, int index) {
                      /// vertical list padding
                      if (index == 10) {
                        return SizedBox(height: 100);
                      }
                      if (index == 0) {
                        return SizedBox(height: 20);
                      } else {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index % 2 == 0 ? 40 : 0,
                            right: index % 2 == 0 ? 0 : 40,
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: appColors.gray3.withOpacity(0.12),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                              'Они сошлись. Волна и камень, Стихи и проза, лед и пламень, Не столь различны меж собой',
                              style: appTextStyles.body1.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        );
                      }
                    }),
              ),
              Positioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: appColors.gray3.withOpacity(0.12),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 10.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6, right: 4),
                          child: Image.asset('assets/images/camera.png'),
                        ),
                        Expanded(
                            child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: appTextStyles.headline5.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            // fontWeight: FontWeight.w400,
                            //   color: appColors.white.withOpacity(0.5)
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // hintText: 'Имя',
                            hintStyle: appTextStyles.headline5.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              //   color: appColors.white.withOpacity(0.5)),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/vector/send_msg.svg',
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
