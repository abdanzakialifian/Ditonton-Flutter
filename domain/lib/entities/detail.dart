import 'package:domain/entities/genre.dart';
import 'package:domain/entities/season.dart';
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

  const Detail({
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
