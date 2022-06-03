import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_board_app/src/controller/Youtuber_Controller.dart';
import '../controller/liveStreamingDetailController.dart';
import '../models/video.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoWidget extends StatefulWidget {
  final Video? video;
  const VideoWidget({Key? key, this.video}) : super(key: key);
  @override
  _VideoWidgetState createState()=>_VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>{
  late LiveStreamingDetailController _liveStreamDetailController;
  late YoutuberController _youtuberController;
  @override
  void initState(){
    _liveStreamDetailController = Get.put(LiveStreamingDetailController(video: widget.video),tag:widget.video?.id.videoId);
    _youtuberController = Get.put(YoutuberController(video: widget.video),tag:widget.video?.snippet.channelId);

    super.initState();
  }
  Widget _thumbnail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Container(
            color: Colors.grey.withOpacity(0.5),
            child: CachedNetworkImage(
              imageUrl:widget.video!.snippet.thumbnails.medium.url,
              placeholder:(context,url)=>Container(
                  height: 230,
                  child: Center(child: CircularProgressIndicator()),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 12, bottom: 20, top:8),
      child: Row(
        children: [
          Obx(() => CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(_youtuberController.getYoutuberThumnailUrl()).image,
           ),
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
                  Flexible(
                    child:
                    Text(
                     widget.video!.snippet.channelTitle,
                     style: TextStyle(fontSize: 12),
                    ),
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
