
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/new_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()){
    _loadFavoritesLocalStorage();
  }


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Article> _favorites = [];

  void addFavorite(Article article){
    if (state is FavoriteLoaded){
      article.favorite = true;

      final favorites = (state as FavoriteLoaded).favorites;

      if (!favorites.contains(article)){
        favorites.add(article);
        emit(FavoriteLoaded(favorites));
      }
    } else {
      emit(FavoriteLoaded([article]));
    }
    _saveFavoritesLocal(); // Chama o método para salvar a lista atualizada de favoritos
  }

  void removeFavorite(Article article){
    if(state is FavoriteLoaded){
      final favorites =  (state as FavoriteLoaded).favorites;
      if(!favorites.contains(article)){
        return;
      }
      favorites.remove(article);
      emit(FavoriteLoaded(List.from(favorites)..remove(article)));
      _saveFavoritesLocal();
    }
  }
  Future<void> _saveFavoritesLocal() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> encodedList = (state as FavoriteLoaded).favorites.map((article) => json.encode(article.toJson())).toList();
    await prefs.setStringList("favorites", encodedList);
  }

  Future<void> _loadFavoritesLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? encodedList = prefs.getStringList('favorites');
    if(encodedList != null){
      _favorites = encodedList.map((articleJson){
        final Map<String,dynamic> json = jsonDecode(articleJson);
        return Article.fromJson(json);
      }).toList();
      emit(FavoriteLoaded(List.from(_favorites)));

    }
  }


  bool isFavorite(Article article){
    if (state is FavoriteLoaded){
      final favorites = (state as FavoriteLoaded).favorites;
      return favorites.any((favArticle) => favArticle.title == article.title);
    }
    return false;
  }

  void toggleFavorite(Article article){
    if (isFavorite(article)){
      removeFavorite(article);

    }
    else{
      addFavorite(article);

    }
  }


}
