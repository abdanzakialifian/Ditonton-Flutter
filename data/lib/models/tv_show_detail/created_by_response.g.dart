// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedByResponse _$CreatedByResponseFromJson(Map<String, dynamic> json) =>
    CreatedByResponse(
      id: json['id'] as int?,
      creditId: json['credit_id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CreatedByResponseToJson(CreatedByResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };
