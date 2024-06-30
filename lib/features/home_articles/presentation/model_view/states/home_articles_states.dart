import 'package:equatable/equatable.dart';

import '../../../../../core/enums/state_status.dart';
import '../../../domain/entites/article_entity.dart';

class HomeArticlesStates extends Equatable {
  const HomeArticlesStates({
    this.homeArticlesState = StateStatus.initial,
    this.articles = const [],
    this.message = '',
  });

  final StateStatus homeArticlesState;
  final List<ArticleEntity> articles;
  final String message;

  HomeArticlesStates copyWith({
    StateStatus? homeArticlesState,
    List<ArticleEntity>? articles,
    String? message,
  }) {
    return HomeArticlesStates(
      homeArticlesState: homeArticlesState ?? this.homeArticlesState,
      articles: articles ?? this.articles,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        homeArticlesState,
        articles,
        message,
      ];
}
