import 'package:ditonton/data/models/genre_response.dart';
import 'package:ditonton/data/models/tvshowdetail/created_by_response.dart';
import 'package:ditonton/data/models/tvshowdetail/last_episode_to_air_response.dart';
import 'package:ditonton/data/models/tvshowdetail/network_response.dart';
import 'package:ditonton/data/models/tvshowdetail/production_country_response.dart';
import 'package:ditonton/data/models/tvshowdetail/season_response.dart';
import 'package:ditonton/data/models/tvshowdetail/spoken_language_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_detail_response.g.dart';

@JsonSerializable()
class TvShowDetailResponse extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<CreatedByResponse>? createdBy;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreResponse>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final DateTime? lastAirDate;
  final LastEpisodeToAirResponse? lastEpisodeToAir;
  final String? name;
  final dynamic nextEpisodeToAir;
  final List<NetworkResponse>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<NetworkResponse>? productionCompanies;
  final List<ProductionCountryResponse>? productionCountries;
  final List<SeasonResponse>? seasons;
  final List<SpokenLanguageResponse>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
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
