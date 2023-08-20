import 'dart:convert';
import 'package:core/data/models/genre/genre_response.dart';
import 'package:core/data/models/movie/movie_response.dart';
import 'package:core/data/models/moviedetail/movie_detail_response.dart';
import 'package:core/data/models/tvshow/tv_show_response.dart';
import 'package:core/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:core/data/models/watchlist_table.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/detail.dart';
import 'package:core/domain/entities/watchlist.dart';
import '../json_reader.dart';

const dummyApiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';

const dummyBaseUrl = 'https://api.themoviedb.org/3';

final dummyMovieJsonResponse = readJson('dummy_data/dummy_movie_response.json');

final dummyTvShowJsonResponse =
    readJson('dummy_data/dummy_tv_show_response.json');

final dummyMovieEmptyJsonResponse =
    readJson('dummy_data/dummy_movie_empty_response.json');

final dummyTvShowEmptyJsonResponse =
    readJson('dummy_data/dummy_tv_show_empty_response.json');

final dummyMovieDetailJsonResponse =
    readJson('dummy_data/dummy_movie_detail_response.json');

final dummyTvShowDetailJsonResponse =
    readJson('dummy_data/dummy_tv_show_detail_response.json');

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

const testMovieDetail = Detail(
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

final dummyWatchlistMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
  'category': "Movies or Tv Shows"
};

final dummyGenreResponseMap = {
  'id': 1,
  'name': "Adventure",
};

const dummyGenreResponse = GenreResponse(id: 1, name: "Adventure");

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

final dummyMovieResponseMap = {
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "genre_ids": [1, 2, 3, 4],
      "id": 1,
      "original_language": "en",
      "original_title": "Original Title",
      "overview": "Overview",
      "popularity": 1.0,
      "poster_path": "/path.jpg",
      "release_date": "2020-05-05",
      "title": "Title",
      "video": false,
      "vote_average": 1.0,
      "vote_count": 1
    }
  ],
};

final dummyTvShowResponseMap = {
  "results": [
    {
      "backdrop_path": "/yYNa1nqvNK94xZz3eKyfvZdAvPi.jpg",
      "first_air_date": "2020-11-02",
      "genre_ids": [10766],
      "id": 112470,
      "name": "Here it all begins",
      "origin_country": ["FR"],
      "original_language": "fr",
      "original_name": "Ici tout commence",
      "overview": "overview",
      "popularity": 5208.508,
      "poster_path": "/60cqjI590JKXCAABqCStVmSBGET.jpg",
      "vote_average": 6.7,
      "vote_count": 17
    }
  ],
};

final dummyCategoryMovies =
    dummyMovieResponse.movieList?.map((model) => model.toCategory()).toList();

final dummyCategoryTvShows =
    dummyTvShowResponse.tvShowList?.map((model) => model.toCategory()).toList();
