import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/apis/api_service.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/model/marvel_movies_model.dart';
import 'package:marvel_app/model/mcu_movie_pages.dart';
import 'package:marvel_app/screens/details_screen.dart';
import 'package:marvel_app/screens/setting_screens.dart';
import 'package:marvel_app/widgets/custom_app_bar.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
        name: McuMoviePages.homePath,
        key: ValueKey(McuMoviePages.homePath),
        child: HomeScreen()
      );
  }
  
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<McuData> mcuData = [];

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MovieManager>(context,listen: false).getMovieData();
  
  }
  @override
  Widget build(BuildContext context) {
    mcuData = Provider.of<MovieManager>(context).movieItem;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(appBarTittle: "Home page", showIcon: true),
      body: mcuData!=null ? GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing:10,
        mainAxisSpacing:10
), itemCount: mcuData.length,
itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap: (){
            Provider.of<MovieManager>(context,listen: false).movieTapped(index);
            //HelperFunction.navigatetoNextScreen(context, DetailsScreen(mcuData: mcuData[index],));

          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:mcuData[index].coverUrl == null ? Image.asset('images/marvel_logo.jpeg'): CachedNetworkImage(
              imageUrl: mcuData[index].coverUrl??"",
            ),
          ),
        );
      }):CircularProgressIndicator()
    );
  }

}
