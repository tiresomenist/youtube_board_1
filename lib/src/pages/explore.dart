import 'package:flutter/material.dart';
import 'package:youtube_board_app/src/components/custom_appbar.dart';
import 'package:youtube_board_app/src/pages/category.dart';
import 'package:youtube_board_app/src/pages/ranking.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

  final choices = ["ㅤ카테고리ㅤ", "ㅤㅤ랭킹ㅤㅤ"]; //tapbar의 기능 한계로 임시로 한 작업.

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAppBar(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
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
                labelPadding: const EdgeInsets.symmetric(horizontal: 18.0), //tapbar의 기능 한계로 임시로 한 작업.
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [Category(), Ranking()],
        ),
      ),
    );
  }
}