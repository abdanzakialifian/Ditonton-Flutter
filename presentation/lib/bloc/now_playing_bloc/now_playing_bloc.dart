import 'package:domain/entities/category.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetAiringTodayTvShows _getAiringTodayTvShows;

  NowPlayingBloc(this._getAiringTodayTvShows, this._getNowPlayingMovies)
      : super(NowPlayingEmpty()) {
    on<FetchNowPlayingMovies>(
      (event, emit) async {
        emit(NowPlayingLoading());

        final result = await _getNowPlayingMovies.execute();

        result.fold(
          (failure) {
            emit(
              NowPlayingError(failure.message),
            );
          },
          (moviesData) {
            emit(
              NowPlayingData(moviesData),
            );
          },
        );
      },
    );

    on<FetchAiringTodayTvShows>(
      (event, emit) async {
        emit(NowPlayingLoading());

        final result = await _getAiringTodayTvShows.execute();

        result.fold(
          (failure) {
            emit(
              NowPlayingError(failure.message),
            );
          },
          (tvShowsData) {
            emit(
              NowPlayingData(tvShowsData),
            );
          },
        );
      },
    );
  }
}
