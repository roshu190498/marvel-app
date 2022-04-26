import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/constant.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({ Key? key ,
  required this.textController,

  required this.hintText,

  required this.icon,
  
  required this.isObsure,


  }) : super(key: key);

  final TextEditingController textController;

  final String hintText;

  final IconData icon;

  final bool isObsure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        obscureText: isObsure,
        controller: textController,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize : 10,
          fontWeight: FontWeight.bold
        ),
        decoration: Constants().getInputDecoration(hintText: hintText,icon: icon)
      ),
      
    );
  }
}