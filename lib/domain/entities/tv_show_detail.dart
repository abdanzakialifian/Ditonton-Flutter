import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class TvShowDetail extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<Genre>? genres;
  final int? id;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final int? runtime;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? type;

  TvShowDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
    this.type,
  });

  Watchlist toWatchlist() => Watchlist.watchlist(
        id: id,
        type: TV_SHOWS,
        overview: overview,
        posterPath: posterPath,
        title: name,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        runtime,
        name,
        voteAverage,
        voteCount,
      ];
}
