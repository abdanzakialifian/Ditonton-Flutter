import 'dart:convert';

import 'package:ditonton/data/datasources/remote/remote_data_source.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/movie/movie_result_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_result_response.dart';
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieResultResponse>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getAiringTodayTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvShowDetailResponse> getTvShowDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getPopularTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getTopRatedTvShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }
}
