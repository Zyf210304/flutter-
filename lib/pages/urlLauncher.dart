import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UrlLauncherPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async{
                Uri url = Uri.parse('https://www.itying.com');
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }else{
                  print("没法打开这个地址");
                }
              }, child: Text("打开浏览器")),

              const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('拨打电话'),
              onPressed: () async {
                final Uri tel = Uri.parse('tel:10086');
                if (await canLaunchUrl(tel)) {
                  await launchUrl(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('发送短信'),
              onPressed: () async {
                final Uri tel = Uri.parse('sms:10086');               
                if (await canLaunchUrl(tel)) {
                  await launchUrl(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),
             const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('打开支付宝'),
              onPressed: () async {
                final Uri tel = Uri.parse('alipays://');               
                if (await canLaunchUrl(tel)) {
                  await launchUrl(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),   
            const SizedBox(height: 10),
            ElevatedButton(
                child: const Text('打开外部应用-高德地图'),
                onPressed: () async {
                  //https://lbs.amap.com/tools/picker
                  String title = "北京大学";
                  String latitude = "39.992806";  //纬度
                  String longitude = "116.310905";  //	经度
                  Uri uri = Uri.parse(
                      '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2&poiname=$title');
                
                  try {
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      print('无法调起高德地图');
                    }
                  } catch (e) {
                    print('无法调起高德地图');
                  }
                }),          

            ],
          )),
        );
  }
}
