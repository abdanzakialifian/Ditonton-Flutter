import 'dart:convert';
import 'package:data/models/movie/movie_response.dart';
import 'package:data/models/movie_detail/movie_detail_response.dart';
import 'package:data/models/tv_show/tv_show_response.dart';
import 'package:data/models/tv_show_detail/tv_show_detail_response.dart';
import 'package:data/models/watchlist_table.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/entities/detail.dart';
import 'package:domain/entities/watchlist.dart';
import '../json_reader.dart';

final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
  jsonDecode(
    readJson('dummy_data/dummy_movie_detail_response.json'),
  ),
);

final dummyTvShowDetailResponse = TvShowDetailResponse.fromJson(
  jsonDecode(
    readJson('dummy_data/dummy_tv_show_detail_response.json'),
  ),
);

final dummyMovieResponse = MovieResponse.fromJson(
  jsonDecode(
    readJson('dummy_data/dummy_movie_response.json'),
  ),
);

final dummyTvShowResponse = TvShowResponse.fromJson(
  jsonDecode(
    readJson('dummy_data/dummy_tv_show_response.json'),
  ),
);

const dummyWatchlistTable = WatchlistTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  category: "Movies or Tv Shows",
);

const dummyWatchlist = Watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  category: "Movies or Tv Shows",
);

const dummyCategory = Category(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  title: 'title',
);

const dummyDetail = Detail(
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

final dummyCategoryMovies =
    dummyMovieResponse.movieList?.map((model) => model.toCategory()).toList();

final dummyCategoryTvShows =
    dummyTvShowResponse.tvShowList?.map((model) => model.toCategory()).toList();
