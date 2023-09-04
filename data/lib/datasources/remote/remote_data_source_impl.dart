import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:core/exception.dart';
import 'package:data/datasources/remote/remote_data_source.dart';
import 'package:data/models/movie/movie_response.dart';
import 'package:data/models/movie/movie_result_response.dart';
import 'package:data/models/movie_detail/movie_detail_response.dart';
import 'package:data/models/tv_show/tv_show_response.dart';
import 'package:data/models/tv_show/tv_show_result_response.dart';
import 'package:data/models/tv_show_detail/tv_show_detail_response.dart';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  static const _apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const _baseUrl = 'https://api.themoviedb.org/3';

  final IOClient? httpClient;

  RemoteDataSourceImpl({this.httpClient});

  Future<SecurityContext> get _globalContext async {
    final sslCertificate =
        await rootBundle.load("certificates/certificates.pem");
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext
        .setTrustedCertificatesBytes(sslCertificate.buffer.asInt8List());
    return securityContext;
  }

  Future<IOClient> _httpClient() async {
    if (httpClient == null) {
      HttpClient? client = HttpClient(context: await _globalContext);
      client.badCertificateCallback = (cert, host, port) => false;
      return IOClient(client);
    } else {
      return Future.value(httpClient);
    }
  }

  @override
  Future<List<MovieResultResponse>> getNowPlayingMovies() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/movie/now_playing?$_apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getAiringTodayTvShows() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/tv/airing_today?$_apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/movie/$id?$_apiKey'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvShowDetailResponse> getTvShowDetail(int id) async {
    final ioClient = await _httpClient();

    final response = await ioClient.get(Uri.parse('$_baseUrl/tv/$id?$_apiKey'));

    if (response.statusCode == 200) {
      log(response.body);
      return TvShowDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getMovieRecommendations(int id) async {
    final ioClient = await _httpClient();

    final response = await ioClient
        .get(Uri.parse('$_baseUrl/movie/$id/recommendations?$_apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getTvShowRecommendations(int id) async {
    final ioClient = await _httpClient();

    final response = await ioClient
        .get(Uri.parse('$_baseUrl/tv/$id/recommendations?$_apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getPopularMovies() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/movie/popular?$_apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getPopularTvShows() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/tv/popular?$_apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> getTopRatedMovies() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/movie/top_rated?$_apiKey'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> getTopRatedTvShows() async {
    final ioClient = await _httpClient();

    final response =
        await ioClient.get(Uri.parse('$_baseUrl/tv/top_rated?$_apiKey'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieResultResponse>> searchMovies(String query) async {
    final ioClient = await _httpClient();

    final response = await ioClient
        .get(Uri.parse('$_baseUrl/search/movie?$_apiKey&query=$query'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowResultResponse>> searchTvShows(String query) async {
    final ioClient = await _httpClient();

    final response = await ioClient
        .get(Uri.parse('$_baseUrl/search/tv?$_apiKey&query=$query'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).tvShowList ??
          [];
    } else {
      throw ServerException();
    }
  }
}
