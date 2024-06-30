import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/article_model.dart';

abstract class ArticleRepo {
  Future<Either<Failure, List<ArticleModel>>> getHomeArticles();

}