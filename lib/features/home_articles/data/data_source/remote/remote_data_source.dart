import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../models/home_articles_response_model.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: APIConstants.url)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET(APIConstants.homeArticlesEndPoint)
  Future<HomeArticlesResponseModel> getHomeArticles();
}
