import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../model/mcu_movie_pages.dart';

class LoginScreen extends StatefulWidget {

   static MaterialPage page(){
    return MaterialPage(
        name: McuMoviePages.loginPath,
        key: ValueKey(McuMoviePages.loginPath),
        child: LoginScreen()
      );
  }
  
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text('MARVEL',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
              Container(
                height: 150,
                width: 150,
                child: Image.asset('images/marvel_logo.jpeg')
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.grey,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    labelText: 'Email',
                  
                    labelStyle: TextStyle(
                      color: Colors.grey
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.grey
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Provider.of<AppStateManager>(context,listen: false).login("", "");
                     print('Login pressed');
                  },
                  child: Container(
                    child: Center(child: Text('Login')),
                    width: 200,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.grey
                    ),
                  ),
                ),

                SizedBox(
                  height: 20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ",textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.grey),),
                    InkWell(
                      onTap: (){ 
                        HelperFunction.navigatetoNextScreen(context,SignUpScreen());
                      },
                      child: Text('Sign up',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),))
                  ],
                )
                
            ],
           
          ),
        ),
      ),
    );
  }
}