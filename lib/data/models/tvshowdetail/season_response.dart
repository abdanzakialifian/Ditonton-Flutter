import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_response.g.dart';

@JsonSerializable()
class SeasonResponse extends Equatable {
  @JsonKey(name: "air_date")
  final DateTime? airDate;
  @JsonKey(name: "episode_count")
  final int? episodeCount;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "season_number")
  final int? seasonNumber;
  @JsonKey(name: "vote_average")
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

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}
