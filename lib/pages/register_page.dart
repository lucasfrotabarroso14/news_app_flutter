import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/pages/login_page.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

import '../cubits/auth/auth_cubit.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover ,
                        image: AssetImage('assets/images/news-image-at.PNG')

                    )
                ),
              ),
            ),
            Positioned(
              top:  320,
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                height: 500,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),

                child: Column(
                  children: [
                    AppLargeText(text: "Create an account"),
                    SizedBox(height: 20,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 2)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),


                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 2)
                          )
                      ),


                    ),
                    SizedBox(height: 20,),

                    TextField(

                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Repeat Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 2)
                          )
                      ),


                    ),
                    SizedBox(height: 20,),

                    TextButton(

                        onPressed: (){
                          context.read<AuthCubit>().signUp(
                              emailController.text,
                              passwordController.text
                          );
                        },

                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,

                            padding: EdgeInsets.symmetric(horizontal: 130,vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                            )
                        ),
                        child: AppText(text: 'Register',size: 15,color: Colors.white,)),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(
                          "Already have a account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 4,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text( 'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
