
import 'package:news_app_flutter/cubit/news_state.dart';

import '../models/new_model.dart';

abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState{
  final List<Article> favorites;

  FavoriteLoaded(this.favorites);

  List<Object?> get props => [favorites];
}

class LoadingFavoriteState extends FavoriteState{

}

class ErrorLoadedFavoriteState extends NewState{}


