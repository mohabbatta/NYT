// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      fault: json['fault'] == null
          ? null
          : Fault.fromJson(json['fault'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'fault': instance.fault,
    };

Fault _$FaultFromJson(Map<String, dynamic> json) => Fault(
      faultString: json['faultstring'] as String?,
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaultToJson(Fault instance) => <String, dynamic>{
      'faultstring': instance.faultString,
      'detail': instance.detail,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      errorCode: json['errorcode'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'errorcode': instance.errorCode,
    };
