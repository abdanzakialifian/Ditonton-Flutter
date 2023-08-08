import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_result_response.g.dart';

@JsonSerializable()
class TvShowResultResponse extends Equatable {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "first_air_date")
  DateTime firstAirDate;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "origin_country")
  List<String> originCountry;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_name")
  String originalName;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  TvShowResultResponse({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowResultResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowResultResponseToJson(this);

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        name,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
