import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_york_times/core/failure/error_model.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repos/article_repo.dart';
import '../data_source/remote/remote_data_source.dart';
import '../models/article_model.dart';

class ArticleRepoImplementation implements ArticleRepo {
  final RemoteDataSource remoteDataSource;

  ArticleRepoImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ArticleModel>>> getHomeArticles() async {
    try {
      final result = await remoteDataSource.getHomeArticles();
      if (result.status == "OK") {
        return Right(result.articles ?? []);
      } else {
        return const Left(ServerFailure("Something went wrong"));
      }
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data);
      return Left(ServerFailure(errorModel.fault?.faultString ?? ''));
    }
  }
}
