import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:equatable/equatable.dart';

class WatchlistTable extends Equatable {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? overview;

  WatchlistTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory WatchlistTable.fromEntityMovie(MovieDetail movie) => WatchlistTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
      );

  factory WatchlistTable.fromEntityTvShow(TvShowDetail tvShow) =>
      WatchlistTable(
        id: tvShow.id,
        title: tvShow.name,
        posterPath: tvShow.posterPath,
        overview: tvShow.overview,
      );

  factory WatchlistTable.fromMap(Map<String, dynamic> map) => WatchlistTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  Movie toEntityMovie() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  TvShow toEntityTvShow() => TvShow.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
