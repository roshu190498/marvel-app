import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFunction{

  static void navigatetoNextScreen(BuildContext ctx,Widget screen){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_)=>screen));
  }

  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;


  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}