import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/youtube_video_result.dart';
import '../repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  String key = "searchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  late SharedPreferences _profs;
  ScrollController scrollController = ScrollController();
  late String _currentKeyword;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    _event();
    _profs = await SharedPreferences.getInstance();
    List<dynamic> initData = _profs.getStringList(key) ?? [];
    history(initData.map<String>((_) => _.toString()).toList());
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != "") {
        _searchYoutube(_currentKeyword);
      }
    });
  }

  void submitSearch(String searchKey) {
    history.addIf(!history.contains(searchKey), searchKey);
    _profs.setStringList(key, history);
    _currentKeyword = searchKey;
    _searchYoutube(searchKey);
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult? youtubeVideoResultFromServer = await YoutubeRepository
        .to
        .search(searchKey, youtubeVideoResult.value.nextPageToken ?? "");
    //youtubeVideoResult(youtubeVideoResultFromServer);
    if (youtubeVideoResultFromServer != null && youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items!.isNotEmpty) {
      youtubeVideoResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
        youtube.items?.addAll(youtubeVideoResultFromServer.items ?? []);
      });
    }
  }
}