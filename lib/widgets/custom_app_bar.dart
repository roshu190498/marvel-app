
import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/screens/cart_screen.dart';
import 'package:marvel_app/screens/login_screen.dart';
import 'package:marvel_app/screens/setting_screens.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.appBarTittle,
    required this.showIcon
  }) : super(key: key);

  final String appBarTittle;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTittle),
      actions: [
        showIcon? IconButton(onPressed: (){
          Provider.of<AppStateManager>(context,listen: false).onIsCart(true);
        }, icon: Icon(Icons.shopping_cart)):Container(),
        showIcon? IconButton(onPressed: (){
          Provider.of<AppStateManager>(context,listen: false).onIsSettings(true);
        }, icon: Icon(Icons.settings)):Container()
      ],
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}