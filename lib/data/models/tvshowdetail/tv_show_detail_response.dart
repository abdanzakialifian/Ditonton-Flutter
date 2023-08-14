import 'package:ditonton/data/models/genre/genre_response.dart';
import 'package:ditonton/data/models/tvshowdetail/created_by_response.dart';
import 'package:ditonton/data/models/tvshowdetail/last_episode_to_air_response.dart';
import 'package:ditonton/data/models/tvshowdetail/network_response.dart';
import 'package:ditonton/data/models/tvshowdetail/production_country_response.dart';
import 'package:ditonton/data/models/tvshowdetail/season_response.dart';
import 'package:ditonton/data/models/tvshowdetail/spoken_language_response.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tv_show_detail_response.g.dart';

@JsonSerializable()
class TvShowDetailResponse extends Equatable {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "created_by")
  final List<CreatedByResponse>? createdBy;
  @JsonKey(name: "episode_run_time")
  final List<int>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  final String? firstAirDate;
  @JsonKey(name: "genres")
  final List<GenreResponse>? genres;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "in_production")
  final bool? inProduction;
  @JsonKey(name: "languages")
  final List<String>? languages;
  @JsonKey(name: "last_air_date")
  final String? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  final LastEpisodeToAirResponse? lastEpisodeToAir;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "next_episode_to_air")
  final dynamic nextEpisodeToAir;
  @JsonKey(name: "networks")
  final List<NetworkResponse>? networks;
  @JsonKey(name: "number_of_episodes")
  final int? numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  final int? numberOfSeasons;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<NetworkResponse>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryResponse>? productionCountries;
  @JsonKey(name: "seasons")
  final List<SeasonResponse>? seasons;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageResponse>? spokenLanguages;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  TvShowDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowDetailResponseToJson(this);

  Detail toEntity() {
    return Detail(
      genres: genres?.map((genre) => genre.toGenre()).toList(),
      id: id,
      overview: overview,
      posterPath: posterPath,
      runtime: episodeRunTime?.isNotEmpty == true ? episodeRunTime?.first : 0,
      title: name,
      voteCount: voteCount,
      voteAverage: voteAverage,
      seasons: seasons?.map((season) => season.toSeason()).toList(),
      status: status,
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
