import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouTubeDetail extends StatelessWidget {
  const YouTubeDetail({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "유튜브 제목",
              //유튜브 제목 검색해다 뽑아와야됨.
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  "현재 0000명 시청 중",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const Text(" · "),
                Text(
                  "2022-05-20",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "유튜브 이름",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "구독자 0000명",
                style: TextStyle(fontSize: 14),
              ),
            ],
          )),
          ElevatedButton(
              onPressed: () {},
              child: Text("즐겨찾기"),
              style: ElevatedButton.styleFrom(primary: Colors.red)),
        ],
      ),
    );
  }

  Widget _buttonZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          onPressed: () {},
          child: Text("YouTube 바로가기"),
          style: ElevatedButton.styleFrom(primary: Colors.grey)),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          Container(
            height: 1,
            color: Colors.black.withOpacity(0.1),
          ),
          _ownerZone(),
          SizedBox(
            height: 20,
          ),
          _buttonZone(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(child: _description())
        ],
      ),
    );
  }
}
