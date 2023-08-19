import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/provider/movie_notifier.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
import 'movie_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetPopularMovies, GetTopRatedMovies])
void main() {
  late MovieNotifier movieNotifier;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    movieNotifier = MovieNotifier(
      getNowPlayingMovies: mockGetNowPlayingMovies,
      getPopularMovies: mockGetPopularMovies,
      getTopRatedMovies: mockGetTopRatedMovies,
    );
  });

  // movie list model
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;
  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  group('Get Now Playing Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.nowPlayingState, RequestState.Empty);
    });

    test('should call get now playing movies method from the usecase',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchNowPlayingMovies();
      // assert
      verify(mockGetNowPlayingMovies.execute());
    });

    test('should change state to loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data now playing movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.Loaded);
      expect(movieNotifier.nowPlayingMovies, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.Error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.popularMoviesState, RequestState.Empty);
    });

    test('should call get popular movies method from the usecase', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchPopularMovies();
      // assert
      verify(mockGetPopularMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data popular movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.Loaded);
      expect(movieNotifier.popularMovies, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.Error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.topRatedMoviesState, RequestState.Empty);
    });

    test('should call get top rated movies method from the usecase', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchTopRatedMovies();
      // assert
      verify(mockGetTopRatedMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.Loaded);
      expect(movieNotifier.topRatedMovies, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.Error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });
}
