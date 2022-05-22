import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/provider/theme_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Image.asset(
      "assets/images/logo.png",
      width: 130,
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
              width: 23,
              height: 23,
              child: SvgPicture.asset("assets/svg/icons/moon_filled.svg"),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset("assets/svg/icons/search.svg"),
            ),
          ),
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
