import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
      print(result);
      if(result == ConnectivityResult.wifi){
        print("wifi");
      }else if(result ==ConnectivityResult.mobile){
         print("手机网络");
      }else if(result==ConnectivityResult.ethernet){
        print("ethernet");
      }else{
        print("没有网络");
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel(); //关闭监听
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('检测网络'),
      ),
      body: const Center(
        child: Text("检测网络"),
      ),
    );
  }
}
