import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_board_app/src/components/custom_appbar.dart';
import 'package:youtube_board_app/src/components/video_widget.dart';
import 'package:youtube_board_app/src/controller/HomeController.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final HomeController controller = Get.put(HomeController());
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(()=>CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          const SliverAppBar(
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed("/detail/${controller.youtubeResult.value.items?[index].id.videoId}");
                  },
                  child: VideoWidget(video: controller.youtubeResult.value.items![index]),
                );
              },
              childCount: controller.youtubeResult.value.items == null ? 0 : controller.youtubeResult.value.items?.length,
            ),
          )
        ],
      ),),
    );
  }
}
