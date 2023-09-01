import 'package:domain/entities/category.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularMovies _getPopularMovies;
  final GetPopularTvShows _getPopularTvShows;

  PopularBloc(
    this._getPopularMovies,
    this._getPopularTvShows,
  ) : super(PopularEmpty()) {
    on<FetchPopularMovies>(
      (event, emit) async {
        emit(PopularLoading());

        final result = await _getPopularMovies.execute();

        result.fold(
          (failure) {
            emit(
              PopularError(failure.message),
            );
          },
          (moviesData) {
            emit(
              PopularData(moviesData),
            );
          },
        );
      },
    );

    on<FetchPopularTvShows>(
      (event, emit) async {
        emit(PopularLoading());

        final result = await _getPopularTvShows.execute();

        result.fold(
          (failure) {
            emit(
              PopularError(failure.message),
            );
          },
          (tvShowsData) {
            emit(
              PopularData(tvShowsData),
            );
          },
        );
      },
    );
  }
}
