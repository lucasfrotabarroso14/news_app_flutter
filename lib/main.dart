import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubits/auth/auth_cubit.dart';

import 'package:news_app_flutter/pages/login_page.dart';
import 'package:news_app_flutter/pages/tab_screen.dart';
import 'package:news_app_flutter/services/firebase_auth_services.dart';
import 'package:news_app_flutter/services/news_service.dart';

import 'cubits/favorite/favorite_cubit.dart';
import 'cubits/news/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  final NewsService _newsService = NewsService();



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => NewsCubit(_newsService)),
        BlocProvider(create: (context)=> FavoriteCubit()),
        BlocProvider(create: (context)=>AuthCubit(_authServices)),

      ],
      child: MaterialApp(
        title: 'News App',


        home: TabScreen(),
      ),
    );
  }
}

