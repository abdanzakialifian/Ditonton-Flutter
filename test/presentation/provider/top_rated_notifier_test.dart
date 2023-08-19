import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies, GetTopRatedTvShows])
void main() {
  late TopRatedNotifier topRatedNotifier;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    topRatedNotifier =
        TopRatedNotifier(mockGetTopRatedMovies, mockGetTopRatedTvShows);
  });

  group('Get Top Rated Movies', () {
    test('initial state should be empty', () {
      expect(topRatedNotifier.state, RequestState.Empty);
    });

    test('should call get top rated movies method from the usecase', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      topRatedNotifier.fetchTopRatedMovies();
      // assert
      verify(mockGetTopRatedMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Loaded);
      expect(topRatedNotifier.data, dummyCategoryMovies);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Error);
      expect(topRatedNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Tv Shows', () {
    test('initial state should be empty', () {
      expect(topRatedNotifier.state, RequestState.Empty);
    });

    test('should call get top rated tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      topRatedNotifier.fetchTopRatedTvShows();
      // assert
      verify(mockGetTopRatedTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Loaded);
      expect(topRatedNotifier.data, dummyCategoryTvShows);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Error);
      expect(topRatedNotifier.message, 'Server Failure');
    });
  });
}
