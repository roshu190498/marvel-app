import 'package:flutter/material.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/model/marvel_movies_model.dart';
import 'package:marvel_app/model/mcu_movie_pages.dart';
import 'package:marvel_app/screens/cart_screen.dart';
import 'package:marvel_app/screens/details_screen.dart';
import 'package:marvel_app/screens/home_screen.dart';
import 'package:marvel_app/screens/login_screen.dart';
import 'package:marvel_app/screens/setting_screens.dart';
import 'package:marvel_app/screens/splash_screen.dart';

class MovieRouterDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin{

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final MovieManager movieManager;

  MovieRouterDelegate({required this.appStateManager,required this.movieManager}) 
    : navigatorKey 
    = GlobalKey<NavigatorState>(){
      appStateManager.addListener(notifyListeners);
      movieManager.addListener(notifyListeners);
    }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
          //add pages here 

          //Splash SCreen
          if(!appStateManager.isInitilized) SplashScreen.page(),

          // Login Screen
          if(appStateManager.isInitilized && !appStateManager.logedIn) LoginScreen.page(),

          // Home Screen
          if(appStateManager.isInitilized && appStateManager.isSignup || appStateManager.logedIn) HomeScreen.page(),


          //Sign up 
          if(appStateManager.isInitilized && appStateManager.isSignup) HomeScreen.page(),


          //Cart Screen 
          if(appStateManager.onCart) CartScreen.page(),


          if(appStateManager.onSettings) SettingScreen.page(),


          //Detail Screen 
          if(movieManager.selectedIndex != -1 && !appStateManager.onCart && !appStateManager.onSettings) DetailsScreen.page(data: movieManager.selectedMovie,index: movieManager.selectedIndex)

      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route,result){
    if(!route.didPop(result)){
      return false;
    }
    
    // Handle Pop pages
    print(route.settings.name);

    if(route.settings.name == McuMoviePages.loginPath ||
    route.settings.name == McuMoviePages.signUpPath || 
    route.settings.name == McuMoviePages.homePath) {
      appStateManager.logout();
    }

    if(route.settings.name == McuMoviePages.cartPath){
      
    }
    


    return true;
  }

   @override
  Future<void> setNewRoutePath(configuration) async => null;



  @override
  void dispose(){
    appStateManager.removeListener(notifyListeners);
    movieManager.removeListener(notifyListeners);
    super.dispose();
  }

}