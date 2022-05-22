import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({Key? key}) : super(key: key);

  Widget _streamer() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Text("유튜브 이름"),
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              Positioned(
                  right: 5,
                  bottom: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: Colors.white, width: 2)),
                  ))
            ],
          ),
          Text("구독자 000명")
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return GridView.builder(
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return _streamer();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예정된 스트림"),
      ),
      body: _bodyWidget(),
    );
  }
}
