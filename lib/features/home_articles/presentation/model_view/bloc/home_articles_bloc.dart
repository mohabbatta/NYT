import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/core/enums/state_status.dart';

import '../../../domain/entites/article_entity.dart';
import '../../../domain/repos/article_repo.dart';
import '../events/home_articles_events.dart';
import '../states/home_articles_states.dart';

class HomeArticlesBloc extends Bloc<HomeArticlesEvents, HomeArticlesStates> {
  final ArticleRepo articleRepo;

  HomeArticlesBloc({required this.articleRepo}) : super(const HomeArticlesStates()) {
    on<GetHomeArticles>(_onGetHomeArticles);
  }

  FutureOr<void> _onGetHomeArticles(GetHomeArticles event, Emitter<HomeArticlesStates> emit) async {
    emit(state.copyWith(homeArticlesState: StateStatus.loading));
    final res = await articleRepo.getHomeArticles();
    res.fold(
      (l) => emit(state.copyWith(homeArticlesState: StateStatus.failure, message: l.message)),
      (r) => emit(state.copyWith(
        homeArticlesState: StateStatus.success,
        articles: List<ArticleEntity>.from(r
            .map(
              (e) => ArticleEntity(
                title: e.title ?? '',
                abstract: e.abstract ?? '',
                imageUrl: e.multiMedia != null && e.multiMedia!.isNotEmpty
                    ? (e.multiMedia?.first.url ?? 'https://via.placeholder.com/150')
                    : 'https://via.placeholder.com/150',
              ),
            )
            .toList()),
      )),
    );
  }
}
