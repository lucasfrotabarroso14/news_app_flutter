import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/pages/favorites_page.dart';
import 'package:news_app_flutter/pages/new_detail_page.dart';
import 'package:news_app_flutter/pages/news_page.dart';
import 'package:news_app_flutter/pages/profile_page.dart';
import '../widgets/app_large_text.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final pages = [NewsPage(), FavoritesPage(),ProfilePage()];
@override
Widget build(BuildContext context) {
  return Scaffold(




    body: pages[_currentIndex],
    bottomNavigationBar:BottomNavigationBar(
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined),
          label:"News",
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.favorite_border),
          label:"Likes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label:"Profile",
        )
      ],

    ),
  );
}
}
