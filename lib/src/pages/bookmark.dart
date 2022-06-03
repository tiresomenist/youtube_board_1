import 'package:flutter/material.dart';
import 'package:youtube_board_app/src/components/custom_appbar.dart';
import 'package:youtube_board_app/src/pages/channel.dart';
import 'package:youtube_board_app/src/pages/live.dart';
import 'package:youtube_board_app/src/pages/reserved.dart';

class Bookmark extends StatelessWidget {
  Bookmark({Key? key}) : super(key: key);

  final choices = ["ㅤㅤ라이브ㅤㅤ", "ㅤㅤ예약됨ㅤㅤ", "ㅤ 전체 채널 ㅤ"]; //tapbar의 기능 한계로 임시로 한 작업.

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAppBar(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: choices.map((String choice) {
                  return Tab(
                    text: choice,
                  );
                }).toList(),
                isScrollable: true,
                indicatorColor: Colors.red,
                indicatorWeight: 3.0,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12.0), //tapbar의 기능 한계로 임시로 한 작업.
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [live(), reserved(), Channel()],
        ),
      ),
    );
  }
}

