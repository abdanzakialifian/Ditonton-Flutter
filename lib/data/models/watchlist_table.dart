import 'package:ditonton/domain/entities/watchlist.dart';
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

  factory WatchlistTable.fromWatchlist(Watchlist watchlist) => WatchlistTable(
        id: watchlist.id,
        title: watchlist.title,
        posterPath: watchlist.posterPath,
        overview: watchlist.overview,
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

  Watchlist toWatchlist() => Watchlist.fromWatchlistTableToWatchlist(this);

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
