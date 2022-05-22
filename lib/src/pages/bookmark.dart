import 'package:flutter/material.dart';
import 'package:youtube_board_app/src/components/custom_appbar.dart';
import 'package:youtube_board_app/src/pages/channel.dart';
import 'package:youtube_board_app/src/pages/live.dart';
import 'package:youtube_board_app/src/pages/reserved.dart';

class Bookmark extends StatelessWidget {
  Bookmark({Key? key}) : super(key: key);

  final choices = ["라이브", "예약됨", "전체 채널"];

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
                labelPadding: const EdgeInsets.symmetric(horizontal: 35.0),
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
