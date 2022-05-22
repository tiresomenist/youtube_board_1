import 'package:get/get.dart';
import 'package:youtube_board_app/src/models/youtube_video_result.dart';
import 'package:youtube_board_app/src/models/liveStreamingDetail.dart';
class YoutubeRepository extends GetConnect{
  static YoutubeRepository get to => Get.find();

  @override
  void onInit(){
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }
  Future<YoutubeVideoResult?> loadVideos()async{
    String url="/youtube/v3/search?key=AIzaSyAopcvyceug9vVjxBvsBq9qkPopmpKuccA&part=snippet&order=viewCount&type=video&eventType=live&regionCode=KR&maxResults=10";
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText);
    }else{
     if(response.body["items"]!=null&&response.body["items"].length>0) {
       return YoutubeVideoResult.fromJson(response.body);
     }
    }
    return Future.error(response.statusText);
  }

  Future<LiveStreamingDetail?> getLiveStreamingDetailById(String? videoId)async{
    String url="/youtube/v3/videos?part=liveStreamingDetails&id=$videoId&key=AIzaSyAopcvyceug9vVjxBvsBq9qkPopmpKuccA";
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText);
    }else{
      if(response.body["items"]!=null&&response.body["items"].length>0) {
        Map<String,dynamic> data=response.body["items"];
        return LiveStreamingDetail.fromJson(data["liveStreamingDetail"]);
      }
    }
    return Future.error(response.statusText);
  }
}