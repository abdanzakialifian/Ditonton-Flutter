// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_episode_to_air_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastEpisodeToAirResponse _$LastEpisodeToAirResponseFromJson(
        Map<String, dynamic> json) =>
    LastEpisodeToAirResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
      airDate: json['airDate'] == null
          ? null
          : DateTime.parse(json['airDate'] as String),
      episodeNumber: json['episodeNumber'] as int?,
      episodeType: json['episodeType'] as String?,
      productionCode: json['productionCode'] as String?,
      runtime: json['runtime'] as int?,
      seasonNumber: json['seasonNumber'] as int?,
      showId: json['showId'] as int?,
      stillPath: json['stillPath'] as String?,
    );

Map<String, dynamic> _$LastEpisodeToAirResponseToJson(
        LastEpisodeToAirResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'airDate': instance.airDate?.toIso8601String(),
      'episodeNumber': instance.episodeNumber,
      'episodeType': instance.episodeType,
      'productionCode': instance.productionCode,
      'runtime': instance.runtime,
      'seasonNumber': instance.seasonNumber,
      'showId': instance.showId,
      'stillPath': instance.stillPath,
    };
