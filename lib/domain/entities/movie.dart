import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final int? voteCount;
  final String? type;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.voteAverage,
      required this.voteCount,
      this.type});

  Movie.watchlist({
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
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        originalTitle,
        overview,
        posterPath,
        title,
        voteAverage,
        voteCount,
      ];
}
