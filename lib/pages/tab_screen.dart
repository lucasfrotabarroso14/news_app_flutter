import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/pages/news_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NewsPage(),
     bottomNavigationBar:BottomNavigationBar(
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
