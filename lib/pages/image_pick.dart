import 'dart:io';
import 'package:exif/exif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:question_answer/compornent/button_compornent.dart';

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {

  final picker = ImagePicker();
  File pickedImage;

  String pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("image pick"),
      ),
      body: Center(
        child: Column(
          children: [
            _imageViewer(),
            _dateViewer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imagePickerButton(),
                _getExifFromImage()
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _imagePickerButton(){
    return GestureDetector(
      onTap: (){
        _imagePickAndSave();
      },
      child: ButtonComponent.buttonContainer("画像取得")
    );
  }

  Widget _dateViewer(){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20
      ),
      child: pickedDate != null
          ? Text("$pickedDate")
          : Text("EXIFは未取得です")
    );
  }

  void _imagePickAndSave() async {
    print("ok");
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(pickedFile.path);
    });
  }

  Widget _getExifFromImage(){
    return GestureDetector(
      onTap: () async{
        final tags = await readExifFromBytes(await pickedImage.readAsBytes());
        String dateTime = tags["Image DateTime"].toString();
        setState(() {
          pickedDate = dateTime;
        });
      },
      child: ButtonComponent.buttonContainer("EXIF取得"),
    );
  }

  Widget _imageViewer(){
    return Container(
      width: 200,
      height: 200,
      child: pickedImage != null
       ?  Image.file(pickedImage)
       :  Text("No Image")
      );
  }

}
