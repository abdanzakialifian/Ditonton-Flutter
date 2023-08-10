import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air_response.g.dart';

@JsonSerializable()
class LastEpisodeToAirResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "air_date")
  final DateTime? airDate;
  @JsonKey(name: "episode_number")
  final int? episodeNumber;
  @JsonKey(name: "episode_type")
  final String? episodeType;
  @JsonKey(name: "production_code")
  final String? productionCode;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "season_number")
  final int? seasonNumber;
  @JsonKey(name: "show_id")
  final int? showId;
  @JsonKey(name: "still_path")
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

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        voteAverage,
        voteCount,
        airDate,
        episodeNumber,
        episodeType,
        productionCode,
        runtime,
        seasonNumber,
        showId,
        stillPath,
      ];
}
