import 'package:get/get.dart';
import 'package:youtube_board_app/src/controller/Youtuber_Controller.dart';
import '../controller/liveStreamingDetailController.dart';
import '../models/video.dart';
class YouTubeDetailController extends GetxController{
  late LiveStreamingDetailController liveStreamingDetailController;
  late YoutuberController youtuberController;
  Video? video;
  @override
  void onInit(){
    liveStreamingDetailController = Get.find(tag: Get.parameters["videoId"]);
    video = liveStreamingDetailController.video;
    youtuberController=Get.put(YoutuberController(video: video),tag:video?.snippet.channelId);
    print(liveStreamingDetailController.video?.snippet.title ?? "");
    print(youtuberController.video?.snippet.channelTitle ?? "");
    print(youtuberController.youtuber.value.snippet?.title ?? "");
    super.onInit();
  }

  String get title=>liveStreamingDetailController.video?.snippet.title ?? "";
  String get viewerCount=> "현재 ${liveStreamingDetailController.liveStreamingDetails.value.concurrentViewers}명 시청 중";
  String get youtuberThumnail=>youtuberController.getYoutuberThumnailUrl();
  String get youtuberName=>youtuberController.video?.snippet.channelTitle ?? "";
  String get youtuberSubscribers=>"구독자 ${youtuberController.youtuber.value?.statistics?.subscriberCount??"0"}명";
}