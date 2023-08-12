import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;
  final String? type;

  TvShow(
      {required this.backdropPath,
      required this.id,
      required this.name,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      this.type});

  TvShow.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.type,
    this.backdropPath,
    this.originalName,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        name,
        originalName,
        overview,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
