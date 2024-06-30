// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      multiMedia: (json['multimedia'] as List<dynamic>?)
          ?.map((e) => MultiMediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'abstract': instance.abstract,
      'multimedia': instance.multiMedia,
    };
