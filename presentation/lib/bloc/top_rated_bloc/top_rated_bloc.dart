import 'package:domain/entities/category.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final GetTopRatedMovies _getTopRatedMovies;
  final GetTopRatedTvShows _getTopRatedTvShows;

  TopRatedBloc(
    this._getTopRatedMovies,
    this._getTopRatedTvShows,
  ) : super(TopRatedEmpty()) {
    on<FetchTopRatedMovies>(
      (event, emit) async {
        emit(TopRatedLoading());

        final result = await _getTopRatedMovies.execute();

        result.fold(
          (failure) {
            emit(
              TopRatedError(failure.message),
            );
          },
          (moviesData) {
            emit(
              TopRatedData(moviesData),
            );
          },
        );
      },
    );

    on<FetchTopRatedTvShows>(
      (event, emit) async {
        emit(TopRatedLoading());

        final result = await _getTopRatedTvShows.execute();

        result.fold(
          (failure) {
            emit(
              TopRatedError(failure.message),
            );
          },
          (tvShowsData) {
            emit(
              TopRatedData(tvShowsData),
            );
          },
        );
      },
    );
  }
}
