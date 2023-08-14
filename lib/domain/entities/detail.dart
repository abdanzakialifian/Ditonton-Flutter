import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class Detail extends Equatable {
  final List<Genre>? genres;
  final int? id;
  final String? overview;
  final String? posterPath;
  final int? runtime;
  final String? title;
  final int? voteCount;
  final double? voteAverage;
  final List<Season>? seasons;
  final String? status;

  Detail({
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.title,
    required this.voteCount,
    required this.voteAverage,
    required this.seasons,
    required this.status,
  });

  Watchlist toWatchlist(String category) => Watchlist.fromDetailToWatchlist(
        this,
        category,
      );

  @override
  List<Object?> get props => [
        genres,
        id,
        overview,
        posterPath,
        runtime,
        title,
        voteCount,
        voteAverage,
        seasons,
        status,
      ];
}
