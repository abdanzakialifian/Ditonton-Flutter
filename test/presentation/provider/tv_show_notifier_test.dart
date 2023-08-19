import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:ditonton/presentation/provider/tv_show_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
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

  // tv show list model
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;
  final dummyCategories =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  group('Get Airing Today Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.Empty);
    });

    test('should call get airing today tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      verify(mockGetAiringTodayTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data airing today tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.Loaded);
      expect(tvShowNotifier.airingTodayTvShows, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchAiringTodayTvShows();
      // assert
      expect(tvShowNotifier.airingTodayTvShowsState, RequestState.Error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.popularTvShowsState, RequestState.Empty);
    });

    test('should call get popular tv shows method from the usecase', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchPopularTvShows();
      // assert
      verify(mockGetPopularTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data popular tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.Loaded);
      expect(tvShowNotifier.popularTvShows, dummyCategories ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchPopularTvShows();
      // assert
      expect(tvShowNotifier.popularTvShowsState, RequestState.Error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Tv Shows', () {
    test('initial state should be empty', () {
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.Empty);
    });

    test('should call get top rated tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchTopRatedTvShows();
      // assert
      verify(mockGetTopRatedTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.Loaded);
      expect(tvShowNotifier.topRatedTvShows, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await tvShowNotifier.fetchTopRatedTvShows();
      // assert
      expect(tvShowNotifier.topRatedTvShowsState, RequestState.Error);
      expect(tvShowNotifier.message, 'Server Failure');
    });
  });
}
