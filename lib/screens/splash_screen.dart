import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/model/marvel_movies_model.dart';
import 'package:marvel_app/screens/home_screen.dart';
import 'package:marvel_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../model/mcu_movie_pages.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
        name: McuMoviePages.slashPath,
        key: ValueKey(McuMoviePages.slashPath),
        child: SplashScreen()
      );
  }

  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   
    Provider.of<AppStateManager>(context,listen: false).initilizedApp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/marvel_logo.jpeg'),
            Text('initilizingg......',
            style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10,),
            CircularProgressIndicator(color: Colors.grey,)
          ],
        ),
      ),
      
    );
  }
}