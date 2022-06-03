import 'package:flutter/material.dart';
// import 'package:flutter_wall_layout/flutter_wall_layout.dart';
// import 'dart:math';


class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  var favCategory=0;  //제일 많이본 카테고리

  final categoryData=[  //카테고리 분류
    {"title":"영화/애니메이션", "id": 1},
    {"title":"자동차", "id": 2},
    {"title":"음악", "id": 10},
    {"title":"반려동물/동물", "id": 15},
    {"title":"스포츠", "id": 17},
    {"title":"단편 영화", "id": 18},
    {"title":"여행/이벤트", "id": 19},
    {"title":"게임", "id": 20},
    {"title":"동영상블로그", "id": 21},
    {"title":"인물/블로그", "id": 22},
    {"title":"코미디", "id": 22},
    {"title":"엔터테인먼트", "id": 23},
    {"title":"뉴스/정치", "id": 25},
    {"title":"노하우/스타일", "id": 26},
    {"title":"교육", "id": 27},
    {"title":"과학기술", "id": 28},
    {"title":"무비", "id": 30},
    {"title":"애니", "id": 31},
    {"title":"액션/모험", "id": 32},
    {"title":"고전", "id": 33},
    {"title":"코미디", "id": 34},
    {"title":"다큐멘터리", "id": 35},
    {"title":"가족", "id": 37},
    {"title":"외국", "id": 38},
    {"title":"공포", "id": 39},
    {"title":"SF/판타지", "id": 40},
    {"title":"스릴러", "id": 41},
    {"title":"쇼츠", "id": 42},
    {"title":"프로그램", "id": 43},
    {"title":"예고편", "id": 44},
  ];


  Widget _buttonWidget() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("게임"),
          style: ElevatedButton.styleFrom(
              primary: Colors.red, minimumSize: Size(150, 35)),
        ),
        const SizedBox(
          width: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("게임"),
          style: ElevatedButton.styleFrom(
              primary: Colors.red, minimumSize: Size(150, 35)),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "추천 카테고리",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("게임"),
            style: ElevatedButton.styleFrom(
                primary: Colors.red, minimumSize: Size(150, 35)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "전체 카테고리",
            style: TextStyle(fontSize: 20),
          ),


          _buttonWidget(),
          SizedBox(height: 5),
          _buttonWidget()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}