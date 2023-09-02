import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/movie_bloc/movie_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import '../provider/movie_notifier_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
])
void main() {
  late MovieBloc movieBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    movieBloc = MovieBloc(
      mockGetNowPlayingMovies,
      mockGetPopularMovies,
      mockGetTopRatedMovies,
    );
  });

  test("initial state shoud be empty", () {
    expect(
      movieBloc.state,
      MovieContainerState.initialState(),
    );
  });

  group(
    'Get Now Playing Movies',
    () {
      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, HasData] when now playing movies is gotten successfully',
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchNowPlayingMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            nowPlayingMoviesState: NowPlayingMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            nowPlayingMoviesState:
                NowPlayingMoviesData(dummyCategoryMovies ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, Error] when get now playing movies is unsuccessful',
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchNowPlayingMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            nowPlayingMoviesState: NowPlayingMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            nowPlayingMoviesState: NowPlayingMoviesError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      tearDown(() => movieBloc.close());
    },
  );

  group(
    'Get Popular Movies',
    () {
      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, HasData] when popular movies is gotten successfully',
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchPopularMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            popularMoviesState: PopularMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            popularMoviesState: PopularMoviesData(dummyCategoryMovies ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );

      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, Error] when get popular movies is unsuccessful',
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchPopularMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            popularMoviesState: PopularMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            popularMoviesState: PopularMoviesError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetPopularMovies.execute());
        },
      );

      tearDown(() => movieBloc.close());
    },
  );

  group(
    'Get Top Rated Movies',
    () {
      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, HasData] when top rated movies is gotten successfully',
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => Right(
              dummyCategoryMovies ?? [],
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            topRatedMoviesState: TopRatedMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            topRatedMoviesState: TopRatedMoviesData(dummyCategoryMovies ?? []),
          ),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      blocTest<MovieBloc, MovieContainerState>(
        'Should emit [Loading, Error] when get top rated movies is unsuccessful',
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => const Left(
              ServerFailure('Server Failure'),
            ),
          );
          return movieBloc;
        },
        act: (bloc) => bloc.add(FetchTopRatedMovies()),
        expect: () => [
          MovieContainerState.initialState().copyWith(
            topRatedMoviesState: TopRatedMoviesLoading(),
          ),
          MovieContainerState.initialState().copyWith(
            topRatedMoviesState: TopRatedMoviesError('Server Failure'),
          ),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      tearDown(() => movieBloc.close());
    },
  );
}
