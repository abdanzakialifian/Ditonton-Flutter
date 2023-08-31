import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/provider/movie_notifier.dart';
import '../../dummy_data/dummy_objects.dart';
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

  group('Get Now Playing Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.nowPlayingState, RequestState.empty);
    });

    test('should call get now playing movies method from the usecase',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchNowPlayingMovies();
      // assert
      verify(mockGetNowPlayingMovies.execute());
    });

    test('should change state to loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data now playing movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.loaded);
      expect(movieNotifier.nowPlayingMovies, dummyCategoryMovies);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchNowPlayingMovies();
      // assert
      expect(movieNotifier.nowPlayingState, RequestState.error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.popularMoviesState, RequestState.empty);
    });

    test('should call get popular movies method from the usecase', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchPopularMovies();
      // assert
      verify(mockGetPopularMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data popular movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.loaded);
      expect(movieNotifier.popularMovies, dummyCategoryMovies);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchPopularMovies();
      // assert
      expect(movieNotifier.popularMoviesState, RequestState.error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Movies', () {
    test('initial state should be empty', () {
      expect(movieNotifier.topRatedMoviesState, RequestState.empty);
    });

    test('should call get top rated movies method from the usecase', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchTopRatedMovies();
      // assert
      verify(mockGetTopRatedMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data top rated movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.loaded);
      expect(movieNotifier.topRatedMovies, dummyCategoryMovies);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await movieNotifier.fetchTopRatedMovies();
      // assert
      expect(movieNotifier.topRatedMoviesState, RequestState.error);
      expect(movieNotifier.message, 'Server Failure');
    });
  });
}
