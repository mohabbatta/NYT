import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'home_articles_response_model.g.dart';

@JsonSerializable()
class HomeArticlesResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "section")
  final String? section;
  @JsonKey(name: "num_results")
  final int? numResults;
  @JsonKey(name: "results")
  final List<ArticleModel>? articles;

  const HomeArticlesResponseModel({this.status, this.section, this.numResults, this.articles});

  factory HomeArticlesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeArticlesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeArticlesResponseModelToJson(this);
}
