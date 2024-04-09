import 'package:flutter/cupertino.dart';
import '../pages/tabs.dart';
import '../pages/device.dart';
import '../pages/network.dart';
import '../pages/urlLauncher.dart';
import '../pages/video.dart';
import '../pages/chewieVideo.dart';
import '../pages/imagePicker.dart';
import '../pages/videoPicker.dart';
//1、配置路由
Map routes = {
  "/": (contxt) => const Tabs(),
  "/device": (contxt) => const DevicePage(),
  "/network": (contxt) => const NetworkPage(),
  "/urlLauncher": (contxt) => const UrlLauncherPage(), 
  "/video":(contxt) => const VideoPage(),
  "/chewieVideo":(contxt) => const ChewieVideoPage(),
  "/imagePicker":(contxt) => const ImagePickerPage(),
  "/videoPicker":(contxt) => const VideoPickerPage(),
};

//2、配置onGenerateRoute  固定写法  这个方法也相当于一个中间件，这里可以做权限判断
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name; //  /news 或者 /search
  final Function? pageContentBuilder =
      routes[name]; //  Function = (contxt) { return const NewsPage()}

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
