import 'dart:convert';
import 'package:core/data/models/movie/movie_response.dart';
import 'package:core/data/models/tvshow/tv_show_response.dart';
import '../json_reader.dart';

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

final dummyCategoryMovies =
    dummyMovieResponse.movieList?.map((model) => model.toCategory()).toList();

final dummyCategoryTvShows =
    dummyTvShowResponse.tvShowList?.map((model) => model.toCategory()).toList();
