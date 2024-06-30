import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart' as di;

import 'core/di/injection_container.dart';
import 'features/home_articles/domain/repos/article_repo.dart';
import 'features/home_articles/presentation/model_view/bloc/home_articles_bloc.dart';
import 'features/home_articles/presentation/model_view/events/home_articles_events.dart';
import 'features/home_articles/presentation/pages/home_articles_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYTimes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            HomeArticlesBloc(articleRepo: sl<ArticleRepo>())..add(GetHomeArticles()),
        child: const ArticlesHomePage(),
      ),
    );
  }
}
