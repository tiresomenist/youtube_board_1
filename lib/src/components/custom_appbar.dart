import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/provider/theme_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Image.asset(
      "assets/images/logo.png",
      height: 24,
    );
  }


  Widget _actions() {
    return Row(
      children: [
        Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Get.isDarkMode
                  ? Get.changeTheme(
                MyThemes.lightTheme,
              )
                  : Get.changeTheme(MyThemes.darkTheme);

            },
            child: SizedBox(

              width: 28,
              height: 28,
              child: SvgPicture.asset("assets/svg/icons/brightness.svg", color:Theme.of(context).indicatorColor), //다크모드용 색상
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 8),
          child: Builder(builder: (context) {
            return GestureDetector(

              onTap: () {},
              child: SizedBox(
                width: 28,
                height: 28,
                child: SvgPicture.asset(
                  "assets/svg/icons/google-search.svg", color: Theme.of(context).primaryColorLight,), //아이콘용색상
              ),
            );
          }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_logo(), _actions()],
    );
  }
}