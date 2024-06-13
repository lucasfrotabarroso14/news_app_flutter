import '../models/new_model.dart';

abstract class NewState{}

class InitialNewState extends NewState{}

class LoadingState extends NewState{}

class LoadedState extends NewState{
  final List<Article> articles;
  LoadedState(this.articles);
}

class ErrorLoadedState extends NewState{}

