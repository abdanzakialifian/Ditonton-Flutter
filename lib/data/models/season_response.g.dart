// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonResponse _$SeasonResponseFromJson(Map<String, dynamic> json) =>
    SeasonResponse(
      airDate: json['airDate'] == null
          ? null
          : DateTime.parse(json['airDate'] as String),
      episodeCount: json['episodeCount'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      seasonNumber: json['seasonNumber'] as int?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SeasonResponseToJson(SeasonResponse instance) =>
    <String, dynamic>{
      'airDate': instance.airDate?.toIso8601String(),
      'episodeCount': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'seasonNumber': instance.seasonNumber,
      'voteAverage': instance.voteAverage,
    };
