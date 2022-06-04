import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_board_app/src/controller/youtube_search_controller.dart';

import '../components/video_widget.dart';

class YoutubeSearch extends GetView<YoutubeSearchController>{
  const YoutubeSearch({Key? key}) : super(key: key);
  Widget _searchHistory(){
    return ListView(
      children: List.generate(
          controller.history.length,(index){
            return ListTile(
              onTap: (){
                controller.submitSearch(controller.history[index]);
              },
              leading: SvgPicture.asset("assets/svg/icons/wall-clock.svg",width: 20),
              title: Padding(
                padding: const EdgeInsets.only(bottom:3),
                child: Text(controller.history[index]),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 15),
            );
          }
      ),
    );
  }

  Widget _searchResultView(){
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children:List.generate(controller.youtubeVideoResult.value.items!.length,(index){
          return GestureDetector(
              onTap: () {
            Get.toNamed("/detail/${controller.youtubeVideoResult.value.items?[index].id.videoId}");
          },
          child: VideoWidget(video: controller.youtubeVideoResult.value.items![index]),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          onSubmitted: (value){
            controller.submitSearch(value);
          },
          onTap: (){
            _searchHistory();
          },
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5)
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.youtubeVideoResult.value.items!.isNotEmpty
            ? _searchResultView()
            : _searchHistory(),
      ),
    );
  }
}