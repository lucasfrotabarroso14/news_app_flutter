import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';
import 'package:news_app_flutter/widgets/category_button.dart';

import '../widgets/new_card.dart';
import '../widgets/news_item_carrosel.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});


  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Breaking News"),
                AppText(text: "See All"),


              ],

            ),


          ),
          Container(

            height: 160,
            width: 355,

            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (int page){
                    setState(() {
                      _currentPage = page;
                    });
                  },
                controller: _pageController,

                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {

                  return Padding(

                    padding: const EdgeInsets.all(6),
                    child: NewsItemCarrosel(),
                  );
                },
              ),
                Positioned(
                  bottom: 20,
                  left: (MediaQuery.of(context).size.width)/3,
                  child: Row(

                    children: List.generate(3, (index) => Container(
                      width: 8,
                      height: 8,
                      margin:  EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage ==index? Colors.blue : Colors.white
                      ),


                    )),
                  ),

                ),
        ]
            ),


          ),
          Container(
            height: 50,
            width: 400,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context,index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CategoryButton(),

              ),
            )
          ),
          SizedBox(height: 10,),
          Expanded(

            // height: 350,
            // width: double.maxFinite,

            child: ListView.builder(
              itemCount: 4,
                itemBuilder: (context,index) => Padding(
                    padding: const EdgeInsets.all(10),
                  child: NewCard(),
                )
            ),
          )
        ],
      ),
    );
  }
}
