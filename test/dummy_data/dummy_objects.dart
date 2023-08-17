import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/entities/detail.dart';

final testMovie = Category(
  id: 557,
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  title: 'Spider-Man',
);

final testMovieList = [testMovie];

final testMovieDetail = Detail(
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
    status: "Ended",
    seasons: []);

final testWatchlistMovie = Category(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final dummyWatchlistTable = WatchlistTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  category: "Movies or Tv Shows",
);

final dummyWatchlistMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};
