import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air_response.g.dart';

@JsonSerializable()
class LastEpisodeToAirResponse {
  final int? id;
  final String? name;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  LastEpisodeToAirResponse({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory LastEpisodeToAirResponse.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirResponseToJson(this);
}
