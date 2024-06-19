import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubits/auth/auth_cubit.dart';
import 'package:news_app_flutter/pages/register_page.dart';
import 'package:news_app_flutter/pages/tab_screen.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

import '../cubits/auth/auth_state.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =  TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {

    bool isPasswordVisible = false;

    if(state is PasswordsVisibleState){
      isPasswordVisible = state.isVisible;
    }

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
                    AppLargeText(text: "Log in"),
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
                      obscureText:  !isPasswordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility), // Ícone de visualização de senha à direita
                            onPressed: () {
                              context.read<AuthCubit>().togglePasswordVisibility();


                            },
                          ),
                        prefixIcon: Icon(Icons.lock),


                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Password',

                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 2)
                          )
                      ),


                    ),
                    SizedBox(height: 20,),

                    TextButton(

                        onPressed: (){
                          context.read<AuthCubit>().signIn(
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
                        child: AppText(text: 'Log in',size: 15,color: Colors.white,)),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 4,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => RegisterPage())
                            );
                          },
                          child: Text( 'Sign up',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    AppText(text: "Sign up with socials",size: 15,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                          width:60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(16)),
                          child: Center(child: IconButton(onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => TabScreen())
                            );
                          }, icon: Icon(Icons.apple,color: Colors.white,size: 40,)))),
                        SizedBox(width: 10,),
                        Container(
                            width:60,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(16)),
                            child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.white,size: 40,)))),

                    ],)
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  },
);
  }
}
