import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerPage> {
  PickedFile?  _imageFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              ElevatedButton(
                onPressed: _openGallery,
                child: Text("选择图库照片"),
              ),
              this._imageFile==null?
              Text("请选择图片")
                  :Image.file(File(this._imageFile!.path))
            ],
          ),
        ));
  }

  /*拍照*/
  _takePhoto() async {
    PickedFile?  pickedFile = await picker.getImage(source: ImageSource.camera,maxWidth:600,maxHeight: 600);
    if(pickedFile!=null){
      //  print(pickedFile.path);
      //  print(File(pickedFile.path));
      setState(() {
        this._imageFile=pickedFile;
      });
      //图片上传
      this._uploadFile(pickedFile.path);
    }
  }
  /*相册*/
  _openGallery() async {
    PickedFile?  pickedFile = await picker.getImage(source: ImageSource.gallery,maxWidth:600,maxHeight: 600);
    if(pickedFile!=null){
      //  print(pickedFile.path);
      //  print(File(pickedFile.path));
      setState(() {
        this._imageFile=pickedFile;
      });
      //图片上传
      this._uploadFile(pickedFile.path);
    }
  }

  /*上传文件*/
  _uploadFile(String imagePath) async {
    var formData = FormData.fromMap({
      'name': 'wendux',
      'age': 25,
      'file': await MultipartFile.fromFile(imagePath, filename: 'aaa.png'),
    });
    //https://jd.itying.com/imgupload

    //https://jd.itying.com/public/upload/UCO0ZgNYzxkFsjFcGjoVPxkp.png

    var response = await Dio().post('https://jd.itying.com/imgupload', data: formData);

    print(response);
  }
}
