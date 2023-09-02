import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies, GetTopRatedTvShows])
void main() {
  late TopRatedBloc topRatedBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    topRatedBloc = TopRatedBloc(mockGetTopRatedMovies, mockGetTopRatedTvShows);
  });

  test("initial state shoud be empty", () {
    expect(
      topRatedBloc.state,
      TopRatedEmpty(),
    );
  });

  group(
    'Get Top Rated Movies',
    () {
      blocTest<TopRatedBloc, TopRatedState>(
        'Should emit [Loading, HasData] when top rated movies is gotten successfully',
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return topRatedBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedMovies()),
        expect: () =>
            [TopRatedLoading(), TopRatedData(dummyCategoryMovies ?? [])],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      blocTest<TopRatedBloc, TopRatedState>(
        'Should emit [Loading, Error] when get top rated movies is unsuccessful',
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return topRatedBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedMovies()),
        expect: () => [TopRatedLoading(), TopRatedError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      tearDown(() => topRatedBloc.close());
    },
  );

  group(
    'Get Top Rated Tv Shows',
    () {
      blocTest<TopRatedBloc, TopRatedState>(
        'Should emit [Loading, HasData] when top rated tv shows is gotten successfully',
        build: () {
          when(mockGetTopRatedTvShows.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryTvShows ?? [],
            ),
          );
          return topRatedBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedTvShows()),
        expect: () =>
            [TopRatedLoading(), TopRatedData(dummyCategoryTvShows ?? [])],
        verify: (bloc) {
          verify(mockGetTopRatedTvShows.execute());
        },
      );

      blocTest<TopRatedBloc, TopRatedState>(
        'Should emit [Loading, Error] when get top rated tv shows is unsuccessful',
        build: () {
          when(mockGetTopRatedTvShows.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return topRatedBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedTvShows()),
        expect: () => [TopRatedLoading(), TopRatedError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTopRatedTvShows.execute());
        },
      );

      tearDown(() => topRatedBloc.close());
    },
  );
}
