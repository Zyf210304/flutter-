import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [         
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/device");
              },
              child: const Text("Device设备插件")),
          const SizedBox(
            height: 20,
          ),      
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/network");
              },
              child: const Text("检测网络变化")),
          const SizedBox(
            height: 20,
          ),  
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/urlLauncher");
              },
              child: const Text("urlLauncher")),
          const SizedBox(
            height: 20,
          ),              
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/video");
              },
              child: const Text("video播放视频")),
          const SizedBox(
            height: 20,
          ),     
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/chewieVideo");
              },
              child: const Text("chewie播放视频")),
          const SizedBox(
            height: 20,
          ),
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/imagePicker");
              },
              child: const Text("拍照 相册选择图片")),
          const SizedBox(
            height: 20,
          ),
           ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/videoPicker");
              },
              child: const Text("录制视频 相册选择视频")),
          const SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}
