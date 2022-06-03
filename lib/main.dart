import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtube_board_app/src/app.dart';
import 'package:youtube_board_app/src/binding/init_binding.dart';
import 'package:youtube_board_app/src/components/youtube_detail.dart';
import 'package:youtube_board_app/src/provider/theme_provider.dart';
import '../src/controller/youtube_detail_controller.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YouYube Board",
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const App()),
        GetPage(name: "/detail/:videoId", page: () => const YouTubeDetail(),binding: BindingsBuilder(()=>Get.lazyPut<YouTubeDetailController>(() => YouTubeDetailController()))),
      ],
    );
  }
}
