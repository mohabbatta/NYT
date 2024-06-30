import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: "fault")
  Fault? fault;

  ErrorModel({this.fault});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

@JsonSerializable()
class Fault {
  @JsonKey(name: "faultstring")
  String? faultString;
  @JsonKey(name: "detail")
  Detail? detail;

  Fault({this.faultString, this.detail});
  factory Fault.fromJson(Map<String, dynamic> json) => _$FaultFromJson(json);
  Map<String, dynamic> toJson() => _$FaultToJson(this);
}

@JsonSerializable()
class Detail {
  @JsonKey(name: "errorcode")
  String? errorCode;

  Detail({this.errorCode});

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
  Map<String, dynamic> toJson() => _$DetailToJson(this);
}