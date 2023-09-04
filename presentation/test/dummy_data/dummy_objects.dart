import 'dart:convert';
import 'package:data/models/movie/movie_response.dart';
import 'package:data/models/movie_detail/movie_detail_response.dart';
import 'package:data/models/tv_show/tv_show_response.dart';
import 'package:data/models/watchlist_table.dart';
import '../json_reader.dart';

final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
  jsonDecode(
    readJson('dummy_data/dummy_movie_detail_response.json'),
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

final dummyCategoryMovies =
    dummyMovieResponse.movieList?.map((model) => model.toCategory()).toList();

final dummyCategoryTvShows =
    dummyTvShowResponse.tvShowList?.map((model) => model.toCategory()).toList();
