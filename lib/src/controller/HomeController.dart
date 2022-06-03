import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/models/youtube_video_result.dart';
import 'package:youtube_board_app/src/repository/youtube_repository.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.find();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit(){
    _videoLoad();
    _event();
    super.onInit();
  }
  void _event(){
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels
      && youtubeResult.value.nextPageToken!=""){
        _videoLoad();
      }
    });
  }
  void _videoLoad()async{
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to.loadVideos(youtubeResult.value.nextPageToken??"");
    if(youtubeVideoResult!=null && youtubeVideoResult.items !=null && youtubeVideoResult.items!.isNotEmpty){
      youtubeResult.update((youtube) {
        youtube.nextPageToken=youtubeVideoResult.nextPageToken;
        youtube.items?.addAll(youtubeVideoResult.items!);
      });
    }
  }
}
