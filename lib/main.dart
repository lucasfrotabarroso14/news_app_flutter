import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubit/favorite/favorite_cubit.dart';
import 'package:news_app_flutter/cubit/news/news_cubit.dart';
import 'package:news_app_flutter/pages/tab_screen.dart';
import 'package:news_app_flutter/services/news_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final NewsService _newsService = NewsService();



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit(_newsService)),
        BlocProvider(create: (context)=> FavoriteCubit()),

      ],
      child: MaterialApp(
        title: 'News App',


        home: TabScreen(),
      ),
    );
  }
}
