import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/favorite/favorite_cubit.dart';
import '../cubits/favorite/favorite_state.dart';
import '../widgets/new_card.dart';





class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          notificationPredicate: (_) => false,
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
                        onChanged: (value){
                          context.read<FavoriteCubit>().searchNewsByTitle(value);
                        },
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



      ) ,
      body: Column(
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
       )
      );

  }
}
