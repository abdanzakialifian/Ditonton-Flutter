import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:core/domain/usecases/get_popular_tv_shows.dart';
import 'package:core/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:core/presentation/provider/tv_show_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_show_notifier_test.mocks.dart';

@GenerateMocks([GetAiringTodayTvShows, GetPopularTvShows, GetTopRatedTvShows])
void main() {
  late TvShowNotifier tvShowNotifier;
  late MockGetAiringTodayTvShows mockGetAiringTodayTvShows;
  late MockGetPopularTvShows mockGetPopularTvShows;
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;

  setUp(() {
    mockGetAiringTodayTvShows = MockGetAiringTodayTvShows();
    mockGetPopularTvShows = MockGetPopularTvShows();
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    tvShowNotifier = TvShowNotifier(
      getAiringTodayTvShows: mockGetAiringTodayTvShows,
      getPopularTvShows: mockGetPopularTvShows,
      getTopRatedTvShows: mockGetTopRatedTvShows,
    );
  });

  group('Get Airing Today Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.empty);
    });

    test('should call get airing today tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      verify(mockGetAiringTodayTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data airing today tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.loaded);
      expect(tvShowNotifier.airingTodayTvShows, dummyCategoryTvShows);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.popularTvShowsState, RequestState.empty);
    });

    test('should call get popular tv shows method from the usecase', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchPopularTvShows();
      // assert
      verify(mockGetPopularTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data popular tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.loaded);
      expect(tvShowNotifier.popularTvShows, dummyCategoryTvShows ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.empty);
    });

    test('should call get top rated tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchTopRatedTvShows();
      // assert
      verify(mockGetTopRatedTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data top rated tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.loaded);
      expect(tvShowNotifier.topRatedTvShows, dummyCategoryTvShows);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });
}
