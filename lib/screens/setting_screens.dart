import 'package:flutter/material.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../model/mcu_movie_pages.dart';

class SettingScreen extends StatefulWidget {
    static MaterialPage page(){
        return MaterialPage(
            name: McuMoviePages.settingsPath,
            key: ValueKey(McuMoviePages.settingsPath),
            child: SettingScreen()
          );
      }
  
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTittle: "Settings Screen",showIcon: false,),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Provider.of<AppStateManager>(context,listen: false).logout();
              print('Log out');
            }, child: Text('Log out'))
          ],
        )
      ),
      
    );
  }
}