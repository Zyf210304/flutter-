import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  List<Widget> _list=[];
  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final deviceInfoMap = deviceInfo.toMap();
    print(deviceInfo);

    var tempList=deviceInfoMap.entries.map((e){
        return ListTile(
          title: Text("${e.key}:${e.value}"),
        );
    }).toList();

    setState(() {
      _list=tempList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device演示'),
      ),
      body: ListView(
        children:_list,
      ),
    );
  }
}
