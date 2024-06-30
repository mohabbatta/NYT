import 'package:json_annotation/json_annotation.dart';

import 'multi_media_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "abstract")
  final String? abstract;
  @JsonKey(name: "multimedia")
  final List<MultiMediaModel>? multiMedia;

  ArticleModel({
    this.title,
    this.abstract,
    this.multiMedia,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
