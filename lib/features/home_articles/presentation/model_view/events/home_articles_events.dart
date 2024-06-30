import 'package:equatable/equatable.dart';

abstract class HomeArticlesEvents extends Equatable {
  const HomeArticlesEvents();

  @override
  List<Object> get props => [];
}

class GetHomeArticles extends HomeArticlesEvents {}
