import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/controller/youtube_detail_controller.dart';

class YouTubeDetail extends GetView<YouTubeDetailController> {
  const YouTubeDetail({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.title,
              //유튜브 제목 검색해다 뽑아와야됨.
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  controller.viewerCount,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(controller.youtuberThumnail).image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                controller.youtuberName,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                controller.youtuberSubscribers,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey.withOpacity(0.5),
            child: CachedNetworkImage(
              imageUrl:controller.video!.snippet.thumbnails.medium.url,
              placeholder:(context,url)=>Container(
                height: 230,
                child: Center(child: CircularProgressIndicator()),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(child: _description())
        ],
      ),
    );
  }
}
