import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;
  //拍照
  _pickerCamera() async {
    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
    if (pickedFile != null) {
      // print(pickedFile.path);
        //上传图片
      _uplodFile(pickedFile.path);
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  //相册选择
  _pickerGallery() async {
    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    if (pickedFile != null) {
      //上传图片
      _uplodFile(pickedFile.path);
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }
  //上传图片
  _uplodFile(imageDir) async{
      var formData = FormData.fromMap({
        'username': 'itying.com',
        'age': 25,
        'file': await MultipartFile.fromFile(imageDir,filename: 'xxxx.jpg')
      });

      //    https://jd.itying.com/public/upload/ill8K_ZrJWb3OZWrco_LmslO.jpg
      var response = await Dio().post('https://jd.itying.com/imgupload', data: formData);
      print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(onPressed: _pickerCamera, child: const Text("拍照")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _pickerGallery, child: const Text("相册选择")),
            const SizedBox(height: 20),
            _pickedFile == null
                ? const Text("选择照片...")
                : Image.file(File(_pickedFile!.path)), //引入dart:io库
          ],
        ),
      ),
    );
  }
}
