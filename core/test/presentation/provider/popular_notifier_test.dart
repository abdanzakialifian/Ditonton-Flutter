import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/get_popular_movies.dart';
import 'package:core/domain/usecases/get_popular_tv_shows.dart';
import 'package:core/presentation/provider/popular_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_notifier_test.mocks.dart';

@GenerateMocks([GetPopularMovies, GetPopularTvShows])
void main() {
  late PopularNotifier popularNotifier;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetPopularTvShows mockGetPopularTvShows;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetPopularTvShows = MockGetPopularTvShows();
    popularNotifier =
        PopularNotifier(mockGetPopularMovies, mockGetPopularTvShows);
  });

  group('Get Popular Movies', () {
    test('initial state should be empty', () {
      expect(popularNotifier.state, RequestState.empty);
    });

    test('should call get popular movies method from the usecase', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      popularNotifier.fetchPopularMovies();
      // assert
      verify(mockGetPopularMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.loading);
    });

    test(
        'should change state to loaded and get data popular movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.loaded);
      expect(popularNotifier.data, dummyCategoryMovies ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.error);
      expect(popularNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Tv Shows', () {
    test('initial state should be empty', () {
      expect(popularNotifier.state, RequestState.empty);
    });

    test('should call get popular tv shows method from the usecase', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      popularNotifier.fetchPopularTvShows();
      // assert
      verify(mockGetPopularTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.loading);
    });

    test(
        'should change state to loaded and get data popular tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.loaded);
      expect(popularNotifier.data, dummyCategoryTvShows ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.error);
      expect(popularNotifier.message, 'Server Failure');
    });
  });
}
