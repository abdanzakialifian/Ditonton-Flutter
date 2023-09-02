import 'package:domain/entities/category.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieContainerState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;

  MovieBloc(
    this._getNowPlayingMovies,
    this._getPopularMovies,
    this._getTopRatedMovies,
  ) : super(MovieContainerState.initialState()) {
    on<FetchNowPlayingMovies>(
      (event, emit) async {
        emit(
          state.copyWith(
            nowPlayingMoviesState: NowPlayingMoviesLoading(),
          ),
        );

        final result = await _getNowPlayingMovies.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                nowPlayingMoviesState: NowPlayingMoviesError(failure.message),
              ),
            );
          },
          (moviesData) {
            emit(
              state.copyWith(
                nowPlayingMoviesState: NowPlayingMoviesData(moviesData),
              ),
            );
          },
        );
      },
    );

    on<FetchPopularMovies>(
      (event, emit) async {
        emit(
          state.copyWith(
            popularMoviesState: PopularMoviesLoading(),
          ),
        );

        final result = await _getPopularMovies.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                popularMoviesState: PopularMoviesError(failure.message),
              ),
            );
          },
          (moviesData) {
            emit(
              state.copyWith(
                popularMoviesState: PopularMoviesData(moviesData),
              ),
            );
          },
        );
      },
    );

    on<FetchTopRatedMovies>(
      (event, emit) async {
        emit(
          state.copyWith(
            topRatedMoviesState: TopRatedMoviesLoading(),
          ),
        );

        final result = await _getTopRatedMovies.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                topRatedMoviesState: TopRatedMoviesError(failure.message),
              ),
            );
          },
          (moviesData) {
            emit(
              state.copyWith(
                topRatedMoviesState: TopRatedMoviesData(moviesData),
              ),
            );
          },
        );
      },
    );
  }
}
