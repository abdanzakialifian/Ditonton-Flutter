import 'package:ditonton/data/models/genre/genre_response.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/entities/watchlist.dart';

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

final dummyWatchlistTable = WatchlistTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  category: "Movies or Tv Shows",
);

final dummyWatchlist = Watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  category: "Movies or Tv Shows",
);

final dummyWatchlistJson = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final dummyGenreResponse = GenreResponse(id: 1, name: "Adventure");

final dummyCategory = Category(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  title: 'title',
);

final dummyDetail = Detail(
  genres: [],
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  runtime: 0,
  title: 'title',
  voteCount: 0,
  voteAverage: 0,
  seasons: [],
  status: '',
);
