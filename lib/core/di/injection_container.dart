import 'package:get_it/get_it.dart';


import '../../features/home_articles/data/data_source/remote/remote_data_source.dart';
import '../../features/home_articles/data/repos/article_repo_implementation.dart';
import '../../features/home_articles/domain/repos/article_repo.dart';
import '../network/dio_factory.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(DioFactory.getDio()));

  ///Repository
  sl.registerLazySingleton<ArticleRepo>(() => ArticleRepoImplementation(remoteDataSource: sl()));
}
