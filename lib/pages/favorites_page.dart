import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubit/favorite_cubit.dart';
import 'package:news_app_flutter/cubit/favorite_state.dart';
import 'package:news_app_flutter/cubit/news_state.dart';

import '../widgets/new_card.dart';





class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: BlocBuilder<FavoriteCubit,FavoriteState>(
          builder: (context, state){
            if (state is LoadingFavoriteState){
              return Center(child: CircularProgressIndicator());
            }
            else if (state is FavoriteLoaded){

              return ListView.builder(
                itemCount: state.favorites.length,
                  itemBuilder: (context,index) => Padding(
                      padding: const EdgeInsets.all(16),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: NewCard(article: state.favorites[index])
                    ),
                  )
              );

            }
            else if (state is ErrorLoadedFavoriteState){
              return Center(child: Text("Error: Ocorreu um erro"));
            } else {
              return Center(child: Text('No data'));
            }
          },
        ))
      ],
    );
  }
}
