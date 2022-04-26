

import 'package:flutter/material.dart';


class Constants {

  
  InputDecoration getInputDecoration({IconData icon = Icons.abc, String hintText="XYZ"}){
    return InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white,),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold
      )
    );

  }
}