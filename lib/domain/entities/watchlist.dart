import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';

class Watchlist extends Equatable {
  final int? id;
  final String? overview;
  final String? posterPath;
  final String? title;
  final String? category;

  Watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.category,
  });

  factory Watchlist.fromDetailToWatchlist(Detail detail, String category) =>
      Watchlist(
        id: detail.id,
        overview: detail.overview,
        posterPath: detail.posterPath,
        title: detail.title,
        category: category,
      );

  factory Watchlist.fromWatchlistTableToWatchlist(
          WatchlistTable watchlistTable) =>
      Watchlist(
        id: watchlistTable.id,
        overview: watchlistTable.overview,
        posterPath: watchlistTable.posterPath,
        title: watchlistTable.title,
        category: watchlistTable.category,
      );

  @override
  List<Object?> get props => [
        id,
        overview,
        posterPath,
        title,
        category,
      ];
}
