import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({ Key? key ,
  required this.tittle,
  required this.width,
  required this.onPressed
  }) : super(key: key);

  final String tittle;
  final double width;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width*0.7,
        height: 60,
        child: Center(
          child: Text(tittle, style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          ),
          
        ),
        decoration: ShapeDecoration(
          color: Colors.blue,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(38)
          )
          ),
      ),
      onTap: (){
        onPressed();
      },
    );
  }
}