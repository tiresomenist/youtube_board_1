import 'package:flutter/material.dart';

class reserved extends StatelessWidget {
  const reserved({Key? key}) : super(key: key);

  Widget _rankingWidget(int index) {
    return Container(
      child: Row(
        children: [
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
                Text("0000명 대기중"),
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
          title: Text("예정된 스트림"),
        ),
        body: _bodyWidget());
  }
}
