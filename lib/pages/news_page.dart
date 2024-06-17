import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubit/news_state.dart';
import 'package:news_app_flutter/widgets/app_large_text.dart';
import 'package:news_app_flutter/widgets/app_text.dart';
import 'package:news_app_flutter/widgets/category_button.dart';

import '../cubit/news_cubit.dart';
import '../widgets/new_card.dart';
import '../widgets/news_item_carrosel.dart';

class NewsPage extends StatefulWidget {
  NewsPage({super.key});

  List categories=["business","entertainment","general","health","science","sports","technology"];


  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {

    super.initState();
    context.read<NewsCubit>().fetchTopHeadlines();
  }

  void _fetchCategoryNews(String category){
    context.read<NewsCubit>().fetchTopHeadlines(category:category);
  }

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
                BlocBuilder<NewsCubit,NewState>(
                    builder: (context,state){
                      if (state is LoadingState){
                        return Center(child: CircularProgressIndicator());
                      }
                      else if(state is LoadedState){
                        List _carroselUrlImages=[
                        state.articles[0].urlToImage != null ?Image.network(

                            state.articles[0].urlToImage!,
                            fit: BoxFit.cover,
                            width: double.infinity, // Largura do Container
                            height: double.infinity// Ajuste a imagem para cobrir o ClipRRect
                        ):  const  Icon(
                          Icons.image,
                          size: 50.0,
                          color: Colors.grey,
                        ),
                          state.articles[1].urlToImage != null ?Image.network(

                              state.articles[1].urlToImage!,
                              fit: BoxFit.cover,
                              width: double.infinity, // Largura do Container
                              height: double.infinity// Ajuste a imagem para cobrir o ClipRRect
                          ):  const  Icon(
                            Icons.image,
                            size: 50.0,
                            color: Colors.grey,
                          ),
                          state.articles[2].urlToImage != null ?Image.network(

                              state.articles[2].urlToImage!,
                              fit: BoxFit.cover,
                              width: double.infinity, // Largura do Container
                              height: double.infinity// Ajuste a imagem para cobrir o ClipRRect
                          ):  const  Icon(
                            Icons.image,
                            size: 50.0,
                            color: Colors.grey,
                          ),

                      ];
                        return  PageView.builder(
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
                              child: NewsItemCarrosel(imageUrl : _carroselUrlImages[index], description:state.articles[index].title),
                            );
                          },
                        );
                      }
                      else if (state is ErrorLoadedState){
                        return Center(child: Text("Error: Ocorreu um erro"));
                      } else {
                        return Center(child: Text('No favorites added yet'));
                      }
                    }),

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
              itemCount: widget.categories.length,
              itemBuilder: (context,index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CategoryButton(
                    category: widget.categories[index],
                    updateCategory: () => _fetchCategoryNews(widget.categories[index])
                ),

              ),
            )
          ),
          SizedBox(height: 10,),
          Expanded(
            // height: 350,
            // width: double.maxFinite,
            child: BlocBuilder<NewsCubit,NewState>(
              builder: (context, state) {
                if(state is LoadingState){
                  return Center(child: CircularProgressIndicator());
                }else if(state is LoadedState){
                  return ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context,index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          margin: EdgeInsets.all(10),
                            child: NewCard(article: state.articles[index])
                        ),
                      )
                  );


                }else if (state is ErrorLoadedState){
                  return Center(child: Text("Error: Ocorreu um erro"));
                } else {
                  return Center(child: Text('No data'));
                }

  },
),
          )
        ],
      ),
    );
  }
}
