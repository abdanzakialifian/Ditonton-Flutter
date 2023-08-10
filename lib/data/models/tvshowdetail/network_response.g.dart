// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponse _$NetworkResponseFromJson(Map<String, dynamic> json) =>
    NetworkResponse(
      id: json['id'] as int?,
      logoPath: json['logoPath'] as String?,
      name: json['name'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$NetworkResponseToJson(NetworkResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };
