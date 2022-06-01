import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/liveStreamingDetailController.dart';
import '../models/video.dart';

class VideoWidget extends StatefulWidget {
  final Video? video;
  const VideoWidget({Key? key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState()=>_VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>{
  late LiveStreamingDetailController _liveStreamDetailController;
  @override
  void initState(){
    _liveStreamDetailController = Get.put(LiveStreamingDetailController(video: widget.video),tag:widget.video?.id.videoId);
    super.initState();
  }
  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(widget.video!.snippet.thumbnails.medium.url,fit:BoxFit.fitWidth,),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(widget.video!.snippet.title,maxLines: 2)
                    ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: const Icon(Icons.more_vert,size: 28,),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.video!.snippet.channelTitle,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(" · "),
                  Obx(() =>
                  Text(
                    _liveStreamDetailController.viewCountString,
                    style: TextStyle(fontSize: 12),
                  ),),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbnail(),
        _simpleDetailInfo(),
      ],
    );
  }
}
