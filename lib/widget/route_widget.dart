


import 'package:flutter/material.dart';
import 'package:question_answer/compornent/button_compornent.dart';
import 'package:question_answer/pages/image_pick.dart';

class RouteWidget {

 static Widget imagePickRoute(context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context){
                return ImagePick();
              }
          )
        );
      },
      child: ButtonComponent.buttonContainer("画像からEXIF")
    );
  }
}
