import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/controller/app_controller.dart';
import 'package:youtube_board_app/src/pages/bookmark.dart';
import 'package:youtube_board_app/src/pages/explore.dart';
import 'package:youtube_board_app/src/pages/home.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
          case RouteName.Explore:
            return Explore();
          case RouteName.Bookmark:
            return Bookmark();
        }
      }),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/home_off.svg", color: Colors.grey[700],),
                activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg", color: Colors.grey[700],),
                label: "홈"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/compass_off.svg",
                  width: 22, color: Colors.grey[700],
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/compass_on.svg",
                  width: 22, color: Colors.grey[700],
                ),
                label: "탐색"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/star_off.svg",
                  width: 22, color: Colors.grey[700],
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/star_on.svg",
                  width: 22, color: Colors.grey[700],
                ),
                label: "즐겨찾기"),
          ],
        ),
      ),
    );
  }
}