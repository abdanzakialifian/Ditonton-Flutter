import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/popular_bloc/popular_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_bloc_test.mocks.dart';

@GenerateMocks([GetPopularMovies, GetPopularTvShows])
void main() {
  late PopularBloc popularBloc;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetPopularTvShows mockGetPopularTvShows;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetPopularTvShows = MockGetPopularTvShows();
    popularBloc = PopularBloc(mockGetPopularMovies, mockGetPopularTvShows);
  });

  test("initial state shoud be empty", () {
    expect(
      popularBloc.state,
      PopularEmpty(),
    );
  });

  group(
    'Get Popular Movies',
    () {
      blocTest<PopularBloc, PopularState>(
        'Should emit [Loading, HasData] when popular movies is gotten successfully',
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return popularBloc;
        },
        act: (bloc) => bloc.add(FetchPopularMovies()),
        expect: () =>
            [PopularLoading(), PopularData(dummyCategoryMovies ?? [])],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );

      blocTest<PopularBloc, PopularState>(
        'Should emit [Loading, HasData] when get popular movies is unsuccessful',
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return popularBloc;
        },
        act: (bloc) => bloc.add(FetchPopularMovies()),
        expect: () => [PopularLoading(), PopularError('Server Failure')],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );
    },
  );

  group(
    'Get Popular Tv Shows',
    () {
      blocTest<PopularBloc, PopularState>(
        'Should emit [Loading, HasData] when popular tv shows is gotten successfully',
        build: () {
          when(mockGetPopularTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return popularBloc;
        },
        act: (bloc) => bloc.add(FetchPopularTvShows()),
        expect: () =>
            [PopularLoading(), PopularData(dummyCategoryTvShows ?? [])],
        verify: (bloc) {
          verify(mockGetPopularTvShows.execute());
        },
      );

      blocTest<PopularBloc, PopularState>(
        'Should emit [Loading, HasData] when get popular tv shows is unsuccessful',
        build: () {
          when(mockGetPopularTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return popularBloc;
        },
        act: (bloc) => bloc.add(FetchPopularTvShows()),
        expect: () => [PopularLoading(), PopularError('Server Failure')],
        verify: (bloc) {
          verify(mockGetPopularTvShows.execute());
        },
      );
    },
  );
}
