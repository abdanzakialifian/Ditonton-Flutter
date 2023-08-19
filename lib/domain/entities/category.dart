import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? overview;
  final String? posterPath;
  final String? title;

  Category({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  factory Category.fromWatchlist(Watchlist watchlist) => Category(
        id: watchlist.id,
        overview: watchlist.overview,
        posterPath: watchlist.posterPath,
        title: watchlist.title,
      );

  @override
  List<Object?> get props => [
        id,
        overview,
        posterPath,
        title,
      ];
}
