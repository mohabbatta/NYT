// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_articles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticlesResponseModel _$HomeArticlesResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeArticlesResponseModel(
      status: json['status'] as String?,
      section: json['section'] as String?,
      numResults: (json['num_results'] as num?)?.toInt(),
      articles: (json['results'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeArticlesResponseModelToJson(
        HomeArticlesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'section': instance.section,
      'num_results': instance.numResults,
      'results': instance.articles,
    };
