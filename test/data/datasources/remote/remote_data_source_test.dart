import 'package:ditonton/data/datasources/remote/remote_data_source_impl.dart';
import 'package:ditonton/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  late RemoteDataSourceImpl remoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('Get Now Playing Movies', () {
    final dummyNowPlayingMoviesResponse = dummyMovieResponse.movieList;

    test('should return list of movie when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/movie/now_playing?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/movie/now_playing?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/movie/now_playing?$DUMMY_API_KEY'),
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
    final dummyAiringTodayTvShowsResponse = dummyTvShowResponse.tvShowList;

    test('should return list of tv show when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/tv/airing_today?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/airing_today?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/airing_today?$DUMMY_API_KEY'),
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

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/movie/$dummyMovieId?$DUMMY_API_KEY'),
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
          Uri.parse('$DUMMY_BASE_URL/movie/$dummyMovieId?$DUMMY_API_KEY'),
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

    test('should return tv show detail when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/tv/$dummyTvShowId?$DUMMY_API_KEY'),
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
          Uri.parse('$DUMMY_BASE_URL/tv/$dummyTvShowId?$DUMMY_API_KEY'),
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
    final dummyMovieRecommendationResponse = dummyMovieResponse.movieList;

    test(
        'should return list of movie recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              '$DUMMY_BASE_URL/movie/$dummyMovieId/recommendations?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/movie/$dummyMovieId/recommendations?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/movie/$dummyMovieId/recommendations?$DUMMY_API_KEY'),
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
    final dummyTvShowRecommendationResponse = dummyTvShowResponse.tvShowList;

    test(
        'should return list of tv show recommendations when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              '$DUMMY_BASE_URL/tv/$dummyTvShowId/recommendations?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/tv/$dummyTvShowId/recommendations?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/tv/$dummyTvShowId/recommendations?$DUMMY_API_KEY'),
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
    final dummyPopularMoviesResponse = dummyMovieResponse.movieList;

    test('should return list of movies when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/movie/popular?$DUMMY_API_KEY'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieJsonResponse, 200));
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
          Uri.parse('$DUMMY_BASE_URL/movie/popular?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
          (_) async => http.Response(dummyMovieEmptyJsonResponse, 200));
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
          Uri.parse('$DUMMY_BASE_URL/movie/popular?$DUMMY_API_KEY'),
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
    final dummyPopularTvShowsResponse = dummyTvShowResponse.tvShowList;

    test('should return list of tv shows when response is success (200)',
        () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/tv/popular?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/popular?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/popular?$DUMMY_API_KEY'),
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
    final dummyTopRatedMoviesResponse = dummyMovieResponse.movieList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/movie/top_rated?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/movie/top_rated?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/movie/top_rated?$DUMMY_API_KEY'),
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
    final dummyGetTopRatedTvShowsResponse = dummyTvShowResponse.tvShowList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$DUMMY_BASE_URL/tv/top_rated?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/top_rated?$DUMMY_API_KEY'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyMovieEmptyJsonResponse, 200),
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
          Uri.parse('$DUMMY_BASE_URL/tv/top_rated?$DUMMY_API_KEY'),
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
    final dummySearchMoviesResponse = dummyMovieResponse.movieList;

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              '$DUMMY_BASE_URL/search/movie?$DUMMY_API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer((_) async => http.Response(dummyMovieJsonResponse, 200));
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
          Uri.parse(
              '$DUMMY_BASE_URL/search/movie?$DUMMY_API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
          (_) async => http.Response(dummyMovieEmptyJsonResponse, 200));
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
          Uri.parse(
              '$DUMMY_BASE_URL/search/movie?$DUMMY_API_KEY&query=$dummyQuery'),
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
    final dummySearchTvShowsResponse = dummyTvShowResponse.tvShowList;

    test('should return list of tv shows when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              '$DUMMY_BASE_URL/search/tv?$DUMMY_API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/search/tv?$DUMMY_API_KEY&query=$dummyQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response(dummyTvShowEmptyJsonResponse, 200),
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
          Uri.parse(
              '$DUMMY_BASE_URL/search/tv?$DUMMY_API_KEY&query=$dummyQuery'),
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
