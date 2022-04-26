import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/screens/cart_screen.dart';
import 'package:marvel_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../model/marvel_movies_model.dart';
import '../model/mcu_movie_pages.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({ Key? key ,required this.mcuData, required this.selectedIndex }) : super(key: key);

  static MaterialPage page({McuData? data , int index = -1}){
    return  MaterialPage(
        name: McuMoviePages.detailspath,
        key: ValueKey(McuMoviePages.detailspath),
        child: DetailsScreen(mcuData: data!, selectedIndex: index,)
      );
  }

  final McuData mcuData;

  final int selectedIndex;


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(cartDataList.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(appBarTittle: 'Detail page',showIcon: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.mcuData?.coverUrl == null ? Image.asset('images/marvel_logo.jpeg') : CachedNetworkImage(imageUrl: widget.mcuData.coverUrl!,width: HelperFunction.getWidth(context),height: HelperFunction.getHeight(context)*0.4,),
              SizedBox(height: 10,),
              Text(widget.mcuData?.title??"Null",style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text(widget.mcuData?.overview??"Null",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                if(getAlreadyAdded(widget.mcuData)){
                  HelperFunction.showToast('already added');
                }else{
                  cartDataList.add(widget.mcuData);
                  Provider.of<AppStateManager>(context,listen: false).onIsCart(true);
                }
              }, child: Text('Add to Cart'))
            ],
          ),
        ),
      ),
      
    );
  }

  bool getAlreadyAdded(McuData data){
    return cartDataList.contains(data);
  }
}