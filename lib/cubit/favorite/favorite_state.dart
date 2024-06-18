
import '../../models/new_model.dart';
import '../news/news_state.dart';

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


class FavoriteSearchLoaded extends FavoriteState{

  final List<Article> searchResults;

  FavoriteSearchLoaded(this.searchResults);

  List<Object?> get props => [searchResults];

}