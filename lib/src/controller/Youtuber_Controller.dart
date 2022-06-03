import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:youtube_board_app/src/models/Youtuber.dart';

import '../models/video.dart';
import '../repository/youtube_repository.dart';

class YoutuberController extends GetxController {
  Video? video;

  YoutuberController({this.video});

  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Youtuber? loadYoutuberInfo = await YoutubeRepository.to.getYoutuberInfoById(
        video?.snippet.channelId);
    youtuber(loadYoutuberInfo);
    super.onInit();
  }
  String getYoutuberThumnailUrl(){
    var thumnailUrl=youtuber.value.snippet?.thumbnails?.medium?.url;
    if(thumnailUrl != null) {
     return thumnailUrl;
    }
    else{
      thumnailUrl = 'https://cdn-icons-png.flaticon.com/512/1946/1946429.png';
      return thumnailUrl;
    }
  }
}