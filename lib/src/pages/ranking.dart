import 'package:flutter/material.dart';
import 'package:youtube_board_app/src/provider/theme_provider.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  Widget _rankingWidget(int index) {
    int i = index + 1;
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            width: 25,
            child: Text(
              i.toString(),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.5),
            width: 160,
            height: 100,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("제목"),
                SizedBox(
                  height: 10,
                ),
                Text("시청자 0000명"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("유튜브 이름")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
        itemBuilder: (BuildContext _context, int index) {
          return Container(
            child: _rankingWidget(index),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(
            height: 5,
          );
        },
        itemCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "현재 실시간 랭킹",
          ),
        ),
        body: _bodyWidget());
  }
}
