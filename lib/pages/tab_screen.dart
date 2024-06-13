import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/pages/favorites_page.dart';
import 'package:news_app_flutter/pages/new_detail_page.dart';
import 'package:news_app_flutter/pages/news_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final pages = [NewsPage(), FavoritesPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60,

        title: Row(
          children: [
          Expanded(
              child:Container(
                margin: EdgeInsets.only(top: 80,bottom: 80),


                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                              decoration: InputDecoration(
                  hintText: 'Procure por noticias...'),
                              ),
                ),
              )
          ),
            IconButton(
                onPressed:(){},
                icon: Icon(Icons.notifications))
        ],)



      ),


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
