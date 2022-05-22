import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  Widget _buttonWidget() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("게임"),
          style: ElevatedButton.styleFrom(
              primary: Colors.grey, minimumSize: Size(150, 35)),
        ),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("게임"),
          style: ElevatedButton.styleFrom(
              primary: Colors.grey, minimumSize: Size(150, 35)),
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
                primary: Colors.grey, minimumSize: Size(150, 35)),
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
