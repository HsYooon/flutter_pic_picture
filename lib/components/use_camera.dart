import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UseCamera extends StatefulWidget {
  const UseCamera({Key? key}) : super(key: key);

  @override
  _UseCameraState createState() => _UseCameraState();
}

class _UseCameraState extends State<UseCamera> {
  late File _image = File('initial file');
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async {
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        _image = File(pickedFile!.path);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FlatButton(
                color: Colors.accents[2],
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                child: Text('Camera')),
            FlatButton(
                color: Colors.accents[5],
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                child: Text('Gallery')),
            showImage(),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    if (_image == null) {
      return Container(
        child: Text("이미지가 없습니다"),
      );
    } else {
      return Image.file(_image);
    }
  }
}
