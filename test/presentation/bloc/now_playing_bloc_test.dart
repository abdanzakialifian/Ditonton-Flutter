import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/now_playing_bloc/now_playing_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'now_playing_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetAiringTodayTvShows])
void main() {
  late NowPlayingBloc nowPlayingBloc;
  late MockGetAiringTodayTvShows mockGetAiringTodayTvShows;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetAiringTodayTvShows = MockGetAiringTodayTvShows();
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    nowPlayingBloc =
        NowPlayingBloc(mockGetAiringTodayTvShows, mockGetNowPlayingMovies);
  });

  test("initial state shoud be empty", () {
    expect(
      nowPlayingBloc.state,
      NowPlayingEmpty(),
    );
  });

  group(
    'Get Now Playing Movies',
    () {
      blocTest<NowPlayingBloc, NowPlayingState>(
        'Should emit [Loading, HasData] when now playing movies is gotten successfully',
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(FetchNowPlayingMovies()),
        expect: () =>
            [NowPlayingLoading(), NowPlayingData(dummyCategoryMovies ?? [])],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      blocTest<NowPlayingBloc, NowPlayingState>(
        'Should emit [Loading, Error] when get now playing movies is unsuccessful',
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(FetchNowPlayingMovies()),
        expect: () => [NowPlayingLoading(), NowPlayingError('Server Failure')],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      tearDown(() => nowPlayingBloc.close());
    },
  );

  group(
    'Get Airing Today Tv Shows',
    () {
      blocTest<NowPlayingBloc, NowPlayingState>(
        'Should emit [Loading, HasData] when airing today tv shows is gotten successfully',
        build: () {
          when(mockGetAiringTodayTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(FetchAiringTodayTvShows()),
        expect: () =>
            [NowPlayingLoading(), NowPlayingData(dummyCategoryTvShows ?? [])],
        verify: (bloc) {
          verify(mockGetAiringTodayTvShows.execute());
        },
      );

      blocTest<NowPlayingBloc, NowPlayingState>(
        'Should emit [Loading, Error] when get airing today tv shows is unsuccessful',
        build: () {
          when(mockGetAiringTodayTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(FetchAiringTodayTvShows()),
        expect: () => [NowPlayingLoading(), NowPlayingError('Server Failure')],
        verify: (bloc) {
          verify(mockGetAiringTodayTvShows.execute());
        },
      );

      tearDown(() => nowPlayingBloc.close());
    },
  );
}
