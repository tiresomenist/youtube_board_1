
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:youtube_board_app/src/repository/youtube_repository.dart';

import '../models/liveStreamingDetail.dart';
import '../models/video.dart';

class liveStreamingDetailController extends GetxController{
  @override
  Video? video;
  liveStreamingDetailController({this.video});
  Rx<LiveStreamingDetail> liveStreamingDetails = LiveStreamingDetail().obs;
  void onInit()async{
    LiveStreamingDetail? loadDetails = await YoutubeRepository.to.getLiveStreamingDetailById(video?.id.videoId);
    liveStreamingDetails(loadDetails);
    super.onInit();
  }
  String get viewCountString => "시청자 ${liveStreamingDetails.value.concurrentViewers}명";
}