// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      json['id'] as int,
      json['earth_date'] as String,
      json['img_src'] as String,
      json['sol'] as int,
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'earth_date': instance.earthDate,
      'sol': instance.sol,
      'img_src': instance.imageUrl,
    };
