


import 'package:flutter/material.dart';

class ButtonComponent{

  static Widget buttonContainer(text){
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(
        horizontal: 6
      ),
      padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20
      ),
      child: Text(text),
    );
  }


}