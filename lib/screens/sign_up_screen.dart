import 'package:flutter/material.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/widgets/custom_app_bar.dart';
import 'package:marvel_app/widgets/primary_button.dart';

import '../model/mcu_movie_pages.dart';
import '../widgets/common_text_field.dart';

class SignUpScreen extends StatefulWidget {

  static MaterialPage page(){
    return MaterialPage(
        name: McuMoviePages.signUpPath,
        key: ValueKey(McuMoviePages.signUpPath),
        child: SignUpScreen()
      );
  }
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final String appBarTittle = "Sign up";

  TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(appBarTittle: appBarTittle,showIcon: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Marel Sign up'),
              Container(
                height: 150,
                width: 150,
                child: Image.asset('images/marvel_logo.jpeg')
                ),
                SizedBox(
                  height: 40,
                ),
                CommonTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  isObsure: false,
                ),
                CommonTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  isObsure: true,
                ),
                SizedBox(height: 20,),
                PrimaryButton(
                  tittle: "Sign up",
                  width: HelperFunction.getWidth(context),
                  onPressed: (){
                    print('Sign up pressed');
                  },
                )


            ],
          ),
        )
        ),

    
    );
  }
}
