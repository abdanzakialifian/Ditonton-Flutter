import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';

import 'genre.dart';

class Watchlist {
  final bool? adult;
  final String? backdropPath;
  final List<Genre>? genres;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final int? runtime;
  final String? title;
  final double? voteAverage;
  final int? voteCount;
  final String? type;

  Watchlist({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.type,
  });

  Watchlist.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.type,
    this.backdropPath,
    this.originalTitle,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.genres,
    this.runtime,
  });

  Movie toEntityMovie() => Movie(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  TvShow toEntityTvShow() => TvShow(
        backdropPath: backdropPath,
        id: id,
        name: title,
        originalName: originalTitle,
        overview: overview,
        posterPath: posterPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
