import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';

import '../cubits/auth/auth_cubit.dart';
import '../cubits/auth/auth_state.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        notificationPredicate: (_) => false,

        title: AppLargeText(text: 'Profile',),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit))


        ],

      ),

      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(


          children: [


              SizedBox(height: 26,),
              Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/vetores-premium/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg?w=740"),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              if(state is AuthenticatedState)
              Container(

                child: AppLargeText(text: state.user.displayName?? "", size: 24,),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5
                        )
                      ]
                  ),

                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.person),
                          SizedBox(width: 10,),
                          if(state is AuthenticatedState)

                            AppText(text: state.user.displayName ?? "Lucas" ,size:16  ,),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.email),
                          SizedBox(width: 10,),
                          if(state is AuthenticatedState)
                            AppText(text: state.user.email, size: 16,),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(

                        children: [
                          SizedBox(width: 10,),


                          Icon(Icons.key),

                          SizedBox(width: 10,),
                          AppText(text: "*************", size: 20,),

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],


                  ),

                ),
              ),
              InkWell(
                onTap: () {},

                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5
                        )
                      ]


                  ),
                  child: InkWell(
                    onTap: ()async {
                      await context.read<AuthCubit>().signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false,
                      );

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.logout, color: Colors.red,),
                        SizedBox(width: 7,),
                        AppLargeText(
                          size: 15, text: "Sair da conta", color: Colors.red,),
                      ],
                    ),
                  ),
                ),
              )

            ],

          );
        },
      ),


    );
  }

}

