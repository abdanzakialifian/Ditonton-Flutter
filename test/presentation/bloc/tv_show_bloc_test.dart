import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetAiringTodayTvShows, GetPopularTvShows, GetTopRatedTvShows])
void main() {
  late TvShowBloc tvShowBloc;
  late MockGetAiringTodayTvShows mockGetAiringTodayTvShows;
  late MockGetPopularTvShows mockGetPopularTvShows;
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;

  setUp(() {
    mockGetAiringTodayTvShows = MockGetAiringTodayTvShows();
    mockGetPopularTvShows = MockGetPopularTvShows();
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    tvShowBloc = TvShowBloc(
      mockGetAiringTodayTvShows,
      mockGetPopularTvShows,
      mockGetTopRatedTvShows,
    );
  });

  test("initial state shoud be empty", () {
    expect(
      tvShowBloc.state,
      TvShowContainerState.initialState(),
    );
  });

  group(
    'Get Airing Today Tv Shows',
    () {
      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, HasData] when airing today tv shows is gotten successfully',
        build: () {
          when(mockGetAiringTodayTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchAiringTodayTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            airingTodayTvShowsState: AiringTodayTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            airingTodayTvShowsState:
                AiringTodayTvShowsData(dummyCategoryTvShows ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetAiringTodayTvShows.execute());
        },
      );

      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, Error] when get airing today tv shows is unsuccessful',
        build: () {
          when(mockGetAiringTodayTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchAiringTodayTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            airingTodayTvShowsState: AiringTodayTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            airingTodayTvShowsState: AiringTodayTvShowsError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetAiringTodayTvShows.execute());
        },
      );
    },
  );

  group(
    'Get Popular Tv Shows',
    () {
      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, HasData] when poopular tv shows is gotten successfully',
        build: () {
          when(mockGetPopularTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchPopularTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            popularTvShowsState: PopularTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            popularTvShowsState: PopularTvShowsData(dummyCategoryTvShows ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetPopularTvShows.execute());
        },
      );

      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, Error] when get popular tv shows is unsuccessful',
        build: () {
          when(mockGetPopularTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchPopularTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            popularTvShowsState: PopularTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            popularTvShowsState: PopularTvShowsError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetPopularTvShows.execute());
        },
      );
    },
  );

  group(
    'Get Top Rated Tv Shows',
    () {
      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, HasData] when top rated tv shows is gotten successfully',
        build: () {
          when(mockGetTopRatedTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            topRatedTvShowsState: TopRatedTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            topRatedTvShowsState:
                TopRatedTvShowsData(dummyCategoryTvShows ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedTvShows.execute());
        },
      );

      blocTest<TvShowBloc, TvShowContainerState>(
        'Should emit [Loading, Error] when get top rated tv shows is unsuccessful',
        build: () {
          when(mockGetTopRatedTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return tvShowBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedTvShows()),
        expect: () => [
          TvShowContainerState.initialState().copyWith(
            topRatedTvShowsState: TopRatedTvShowsLoading(),
          ),
          TvShowContainerState.initialState().copyWith(
            topRatedTvShowsState: TopRatedTvShowsError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedTvShows.execute());
        },
      );
    },
  );
}
