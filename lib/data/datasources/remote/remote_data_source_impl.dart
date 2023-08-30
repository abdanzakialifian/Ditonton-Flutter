import 'dart:convert';
import 'dart:developer';
import 'package:ditonton/data/datasources/remote/remote_data_source.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/movie/movie_result_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/movie_detail/movie_detail_response.dart';
import 'package:ditonton/data/models/tv_show/tv_show_response.dart';
import 'package:ditonton/data/models/tv_show/tv_show_result_response.dart';
import 'package:ditonton/data/models/tv_show_detail/tv_show_detail_response.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  static const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieResultResponse>> getNowPlayingMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getAiringTodayTvShows() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvShowDetailResponse> getTvShowDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

    if (response.statusCode == 200) {
      log(response.body);
      return TvShowDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$baseUrl/movie/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getTvShowRecommendations(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getPopularTvShows() async {
    final response = await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey'));

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
        await client.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getTopRatedTvShows() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'));

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
        .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> searchTvShows(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }
}
