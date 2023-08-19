import 'dart:convert';
import 'package:ditonton/data/datasources/remote/remote_data_source_impl.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';
  final String dummyMovieResponse =
      readJson('dummy_data/dummy_movie_response.json');
  final String dummyTvShowResponse =
      readJson('dummy_data/dummy_tv_show_response.json');

  final String dummyMovieEmptyResponse =
      readJson('dummy_data/dummy_movie_empty_response.json');
  final String dummyTvShowEmptyResponse =
      readJson('dummy_data/dummy_tv_show_empty_response.json');

  late RemoteDataSourceImpl remoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('Get Now Playing Movies', () {
    final dummyNowPlayingMoviesResponse =
        MovieResponse.fromJson(jsonDecode(dummyMovieResponse)).movieList;

    test('should return list of movie when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getNowPlayingMovies();
      // assert
      expect(result, dummyNowPlayingMoviesResponse);
    });

    test('should return empty list of movie when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getNowPlayingMovies();
      // assert
      expect(result, []);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getNowPlayingMovies();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Airing Today Tv Shows', () {
    final dummyAiringTodayTvShowsResponse =
        TvShowResponse.fromJson(jsonDecode(dummyTvShowResponse)).tvShowList;

    test('should return list of tv show when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getAiringTodayTvShows();
      // assert
      expect(result, dummyAiringTodayTvShowsResponse);
    });

    test('should return empty list of tv show when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getAiringTodayTvShows();
      // assert
      expect(result, []);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getAiringTodayTvShows();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Movie Detail', () {
    final dummyMovieId = 1;
    final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
      jsonDecode(
        readJson('dummy_data/dummy_movie_detail_response.json'),
      ),
    );

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/$dummyMovieId?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            readJson('dummy_data/dummy_movie_detail_response.json'), 200),
      );
      // act
      final result = await remoteDataSourceImpl.getMovieDetail(dummyMovieId);
      // assert
      expect(result, dummyMovieDetailResponse);
    });

    test('should throw ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/$dummyMovieId?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getMovieDetail(dummyMovieId);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Tv Show Detail', () {
    final dummyTvShowId = 90521;
    final dummyTvShowDetailResponse = TvShowDetailResponse.fromJson(
      jsonDecode(
        readJson('dummy_data/dummy_tv_show_detail_response.json'),
      ),
    );

    test('should return tv show detail when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$dummyTvShowId?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            readJson('dummy_data/dummy_tv_show_detail_response.json'), 200),
      );
      // act
      final result = await remoteDataSourceImpl.getTvShowDetail(dummyTvShowId);
      // assert
      expect(result, dummyTvShowDetailResponse);
    });

    test('should throw ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$dummyTvShowId?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getTvShowDetail(dummyTvShowId);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Movie Recommendations', () {
    final dummyMovieId = 1;
    final dummyMovieRecommendationResponse = MovieResponse.fromJson(
      jsonDecode(dummyMovieResponse),
    ).movieList;

    test(
        'should return list of movie recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/$dummyMovieId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieResponse, 200),
      );
      // act
      final result =
          await remoteDataSourceImpl.getMovieRecommendations(dummyMovieId);
      // assert
      expect(result, equals(dummyMovieRecommendationResponse));
    });

    test(
        'should return empty list of movie recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/$dummyMovieId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyResponse, 200),
      );
      // act
      final result =
          await remoteDataSourceImpl.getMovieRecommendations(dummyMovieId);
      // assert
      expect(result, []);
    });

    test('should throw ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/$dummyMovieId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getMovieRecommendations(dummyMovieId);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Tv Show Recommendations', () {
    final dummyTvShowId = 90521;
    final dummyTvShowRecommendationResponse = TvShowResponse.fromJson(
      jsonDecode(dummyTvShowResponse),
    ).tvShowList;

    test(
        'should return list of tv show recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$dummyTvShowId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowResponse, 200),
      );
      // act
      final result =
          await remoteDataSourceImpl.getTvShowRecommendations(dummyTvShowId);
      // assert
      expect(result, dummyTvShowRecommendationResponse);
    });

    test(
        'should return empty list of tv show recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$dummyTvShowId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyResponse, 200),
      );
      // act
      final result =
          await remoteDataSourceImpl.getTvShowRecommendations(dummyTvShowId);
      // assert
      expect(result, []);
    });

    test('should throw ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$dummyTvShowId/recommendations?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result =
          remoteDataSourceImpl.getTvShowRecommendations(dummyTvShowId);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Popular Movies', () {
    final dummyPopularMoviesResponse =
        MovieResponse.fromJson(jsonDecode(dummyMovieResponse)).movieList;

    test('should return list of movies when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/popular?$API_KEY'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieResponse, 200));
      // act
      final result = await remoteDataSourceImpl.getPopularMovies();
      // assert
      expect(result, dummyPopularMoviesResponse);
    });

    test('should return empty list of movies when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/popular?$API_KEY'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieEmptyResponse, 200));
      // act
      final result = await remoteDataSourceImpl.getPopularMovies();
      // assert
      expect(result, []);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/popular?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getPopularMovies();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Popular Tv Shows', () {
    final dummyPopularTvShowsResponse =
        TvShowResponse.fromJson(jsonDecode(dummyTvShowResponse)).tvShowList;

    test('should return list of tv shows when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getPopularTvShows();
      // assert
      expect(result, dummyPopularTvShowsResponse);
    });

    test('should return empty list of tv shows when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getPopularTvShows();
      // assert
      expect(result, []);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getPopularTvShows();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Top Rated Movies', () {
    final dummyTopRatedMoviesResponse =
        MovieResponse.fromJson(jsonDecode(dummyMovieResponse)).movieList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getTopRatedMovies();
      // assert
      expect(result, dummyTopRatedMoviesResponse);
    });

    test('should return empty list of movies when response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getTopRatedMovies();
      // assert
      expect(result, []);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getTopRatedMovies();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Get Top Rated Tv Shows', () {
    final dummyGetTopRatedTvShowsResponse =
        TvShowResponse.fromJson(jsonDecode(dummyTvShowResponse)).tvShowList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getTopRatedTvShows();
      // assert
      expect(result, dummyGetTopRatedTvShowsResponse);
    });

    test('should return empty list of movies when response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.getTopRatedTvShows();
      // assert
      expect(result, []);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.getTopRatedTvShows();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Search Movies', () {
    final dummyQuery = 'Title';
    final dummySearchMoviesResponse = MovieResponse.fromJson(
      jsonDecode(dummyMovieResponse),
    ).movieList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieResponse, 200));
      // act
      final result = await remoteDataSourceImpl.searchMovies(dummyQuery);
      // assert
      expect(result, dummySearchMoviesResponse);
    });

    test('should return empty list of movies when response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieEmptyResponse, 200));
      // act
      final result = await remoteDataSourceImpl.searchMovies(dummyQuery);
      // assert
      expect(result, []);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.searchMovies(dummyQuery);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('Search Tv Shows', () {
    final dummyQuery = 'Here it all begins';
    final dummySearchTvShowsResponse = TvShowResponse.fromJson(
      jsonDecode(dummyTvShowResponse),
    ).tvShowList;

    test('should return list of tv shows when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.searchTvShows(dummyQuery);
      // assert
      expect(result, dummySearchTvShowsResponse);
    });

    test('should return empty list of tv shows when response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyResponse, 200),
      );
      // act
      final result = await remoteDataSourceImpl.searchTvShows(dummyQuery);
      // assert
      expect(result, []);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final result = remoteDataSourceImpl.searchTvShows(dummyQuery);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
