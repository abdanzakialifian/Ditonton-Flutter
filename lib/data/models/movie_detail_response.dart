import 'package:ditonton/data/models/genre_response.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse extends Equatable {
  MovieDetailResponse({
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

  @JsonKey(name: "adult")
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "budget")
  final int budget;
  @JsonKey(name: "genres")
  final List<GenreResponse> genres;
  @JsonKey(name: "homepage")
  final String homepage;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "revenue")
  final int revenue;
  @JsonKey(name: "runtime")
  final int runtime;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "tagline")
  final String tagline;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "video")
  final bool video;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  // factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
  //     MovieDetailResponse(
  //       adult: json["adult"],
  //       backdropPath: json["backdrop_path"],
  //       budget: json["budget"],
  //       genres: List<GenreModel>.from(
  //           json["genres"].map((x) => GenreModel.fromJson(x))),
  //       homepage: json["homepage"],
  //       id: json["id"],
  //       imdbId: json["imdb_id"],
  //       originalLanguage: json["original_language"],
  //       originalTitle: json["original_title"],
  //       overview: json["overview"],
  //       popularity: json["popularity"].toDouble(),
  //       posterPath: json["poster_path"],
  //       releaseDate: json["release_date"],
  //       revenue: json["revenue"],
  //       runtime: json["runtime"],
  //       status: json["status"],
  //       tagline: json["tagline"],
  //       title: json["title"],
  //       video: json["video"],
  //       voteAverage: json["vote_average"].toDouble(),
  //       voteCount: json["vote_count"],
  //     );

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);

  // Map<String, dynamic> toJson() => {
  //       "adult": adult,
  //       "backdrop_path": backdropPath,
  //       "budget": budget,
  //       "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
  //       "homepage": homepage,
  //       "id": id,
  //       "imdb_id": imdbId,
  //       "original_language": originalLanguage,
  //       "original_title": originalTitle,
  //       "overview": overview,
  //       "popularity": popularity,
  //       "poster_path": posterPath,
  //       "release_date": releaseDate,
  //       "revenue": revenue,
  //       "runtime": runtime,
  //       "status": status,
  //       "tagline": tagline,
  //       "title": title,
  //       "video": video,
  //       "vote_average": voteAverage,
  //       "vote_count": voteCount,
  //     };

  MovieDetail toEntity() {
    return MovieDetail(
      adult: this.adult,
      backdropPath: this.backdropPath,
      genres: this.genres.map((genre) => genre.toEntity()).toList(),
      id: this.id,
      originalTitle: this.originalTitle,
      overview: this.overview,
      posterPath: this.posterPath,
      releaseDate: this.releaseDate,
      runtime: this.runtime,
      title: this.title,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }

  @override
  // TODO: implement props
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
