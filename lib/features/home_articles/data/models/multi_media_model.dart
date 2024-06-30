import 'package:json_annotation/json_annotation.dart';

part 'multi_media_model.g.dart';

@JsonSerializable()
class MultiMediaModel {
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "format")
  final String? format;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "caption")
  final String? caption;
  @JsonKey(name: "copyright")
  final String? copyright;

  MultiMediaModel({
    this.url,
    this.format,
    this.type,
    this.caption,
    this.copyright,
  });

  factory MultiMediaModel.fromJson(Map<String, dynamic> json) => _$MultiMediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MultiMediaModelToJson(this);
}
