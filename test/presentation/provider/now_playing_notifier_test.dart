import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/presentation/provider/now_playing_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
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

  // movie list model
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;
  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  // tv show list model
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;
  final dummyCategoriesTvShow =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  group('Get Now Playing Movies', () {
    test('initial state should be empty', () {
      expect(nowPlayingNotifier.state, RequestState.Empty);
    });

    test('should call get now playing movies method from the usecase',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      verify(mockGetNowPlayingMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data now playing movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Loaded);
      expect(nowPlayingNotifier.data, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await nowPlayingNotifier.fetchNowPlayingMovies();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Error);
      expect(nowPlayingNotifier.message, 'Server Failure');
    });
  });

  group('Get Airing Today Tv Shows', () {
    test('initial state should be empty', () {
      expect(nowPlayingNotifier.state, RequestState.Empty);
    });

    test('should call get airing today tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      verify(mockGetAiringTodayTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data airing today tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Loaded);
      expect(nowPlayingNotifier.data, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetAiringTodayTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await nowPlayingNotifier.fetchAiringTodayTvShows();
      // assert
      expect(nowPlayingNotifier.state, RequestState.Error);
      expect(nowPlayingNotifier.message, 'Server Failure');
    });
  });
}
