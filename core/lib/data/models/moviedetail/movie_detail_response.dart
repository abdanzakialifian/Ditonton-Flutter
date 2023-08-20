import 'package:core/data/models/genre/genre_response.dart';
import 'package:core/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse extends Equatable {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "genres")
  final List<GenreResponse>? genres;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "revenue")
  final int? revenue;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  const MovieDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);

  Detail toDetail() => Detail(
        genres: genres?.map((genre) => genre.toGenre()).toList(),
        id: id,
        overview: overview,
        posterPath: posterPath,
        runtime: runtime,
        title: title,
        voteCount: voteCount,
        voteAverage: voteAverage,
        seasons: const [],
        status: status,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
