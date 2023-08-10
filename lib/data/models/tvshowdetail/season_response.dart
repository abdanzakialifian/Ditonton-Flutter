import 'package:json_annotation/json_annotation.dart';

part 'season_response.g.dart';

@JsonSerializable()
class SeasonResponse {
  final DateTime? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  SeasonResponse({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory SeasonResponse.fromJson(Map<String, dynamic> json) =>
      _$SeasonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonResponseToJson(this);
}
