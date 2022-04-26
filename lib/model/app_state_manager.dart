import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {

  bool _initilized = false;
  bool _logedIn = false;
  bool _isSignup = false;
  bool _onSignupComplete = false;
  bool _onCart = false;
  bool _onSettings = false;

  bool get isInitilized => _initilized;
  bool get logedIn => _logedIn;
  bool get isSignup => _isSignup;
  bool get onSignupComplete => _onSignupComplete;
  bool get onCart => _onCart;
  bool get onSettings => _onSettings;


  void initilizedApp(){
    Timer(Duration(seconds: 3),(){
          _initilized = true;
          print(_initilized);
          notifyListeners();
    });
  }


  void login(String username , String password){
    _logedIn = true;
    notifyListeners();
  }

  void onIsSignup(bool flag ){
    _isSignup = flag;
    notifyListeners();
  }


  void onIsSignupComplete(bool flag){
    _onSignupComplete = flag;
    notifyListeners();
  }


  void onIsCart(bool flag){
    _onCart = flag;
    notifyListeners();
  }

  void onIsSettings(bool flag){
    _onSettings = flag;
    notifyListeners();
  }


  void logout(){
  _initilized = false;
  _logedIn = false;
  _isSignup = false;
  _onSignupComplete = false;
  _onCart = false;
  _onSettings = false;
  initilizedApp();
  notifyListeners();
  }
  
}