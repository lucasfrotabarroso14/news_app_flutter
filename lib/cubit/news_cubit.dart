import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubit/news_state.dart';
import 'package:news_app_flutter/services/news_service.dart';

class NewsCubit extends Cubit<NewState> {

  final NewsService _newsService;

  NewsCubit(this._newsService) : super(InitialNewState());

  void fetchTopHeadlines({String category = "general"}) async {
    try{
      emit(LoadingState());
      final articles = await _newsService.getTopHeadLines(category: category);
      emit(LoadedState(articles));

    }catch(e){
      emit(ErrorLoadedState());
    }

  }


}
