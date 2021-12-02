import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MakePhotoPage extends StatefulWidget {
  const MakePhotoPage({Key? key}) : super(key: key);

  @override
  _MakePhotoPageState createState() => _MakePhotoPageState();
}

class _MakePhotoPageState extends State<MakePhotoPage> {
  late File _image = File('initial file');
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 200),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(94, 140, 93, 1)),
                        overlayColor: MaterialStateProperty.all(
                            Color.fromRGBO(245, 159, 83, 0.8)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20))),
                    onPressed: () {},
                    child: Text(
                      "Camera",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(151, 191, 122, 1)),
                        overlayColor: MaterialStateProperty.all(
                            Color.fromRGBO(245, 159, 83, 0.8)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20))),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Text(
                      "Gallery",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
