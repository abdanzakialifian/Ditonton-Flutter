import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvShowDetail extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<Genre>? genres;
  final int? id;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  TvShowDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        name,
        voteAverage,
        voteCount,
      ];
}
