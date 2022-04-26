import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/widgets/custom_app_bar.dart';

import '../model/marvel_movies_model.dart';
import '../model/mcu_movie_pages.dart';

class CartScreen extends StatefulWidget {
  static MaterialPage page(){
    return MaterialPage(
        name: McuMoviePages.cartPath,
        key: ValueKey(McuMoviePages.cartPath),
        child: CartScreen()
      );
  }
  
  const CartScreen({ Key? key }) : super(key: key);


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(appBarTittle: 'Cart Screen',showIcon: false,),
      body: ListView.builder(itemCount: cartDataList.length,itemBuilder: (BuildContext context , int index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.grey.shade600,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: cartDataList[index]==null ? Image.asset('images/marvel_logo.jpeg') :CachedNetworkImage(imageUrl: cartDataList[index].coverUrl!,width: HelperFunction.getWidth(context)*0.2,),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: HelperFunction.getWidth(context) *0.3
                    ),
                    child: Column(
                      children: [
                        Text(cartDataList[index].id.toString()),
                        Text(cartDataList[index].title.toString()),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){
                    cartDataList.removeAt(index);
                    setState(() {});
                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                  SizedBox(height: 20,)    
                ],
              ),
            ),
          ),
        );
      }),
      
    );
  }
}


List<McuData> cartDataList =[];