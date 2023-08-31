import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/provider/now_playing_notifier.dart';
import '../../dummy_data/dummy_objects.dart';
import 'now_playing_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetAiringTodayTvShows])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetAiringTodayTvShows mockGetAiringTodayTvShows;
  late NowPlayingNotifier nowPlayingNotifier;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetAiringTodayTvShows = MockGetAiringTodayTvShows();
    nowPlayingNotifier =
        NowPlayingNotifier(mockGetNowPlayingMovies, mockGetAiringTodayTvShows);
  });

  group('Get Now Playing Movies', () {
    test('initial state should be empty', () {
      expect(nowPlayingNotifier.state, RequestState.empty);
    });

    test('should call get now playing movies method from the usecase',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      verify(mockGetNowPlayingMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.loading);
    });

    test(
        'should change state to loaded and get data now playing movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.loaded);
      expect(nowPlayingNotifier.data, dummyCategoryMovies);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.error);
      expect(nowPlayingNotifier.message, 'Server Failure');
    });
  });

  group('Get Airing Today Tv Shows', () {
    test('initial state should be empty', () {
      expect(nowPlayingNotifier.state, RequestState.empty);
    });

    test('should call get airing today tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      verify(mockGetAiringTodayTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.loading);
    });

    test(
        'should change state to loaded and get data airing today tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.loaded);
      expect(nowPlayingNotifier.data, dummyCategoryTvShows);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.error);
      expect(nowPlayingNotifier.message, 'Server Failure');
    });
  });
}
