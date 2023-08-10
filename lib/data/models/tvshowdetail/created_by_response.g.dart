// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedByResponse _$CreatedByResponseFromJson(Map<String, dynamic> json) =>
    CreatedByResponse(
      id: json['id'] as int?,
      creditId: json['creditId'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$CreatedByResponseToJson(CreatedByResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creditId': instance.creditId,
      'name': instance.name,
      'gender': instance.gender,
      'profilePath': instance.profilePath,
    };
