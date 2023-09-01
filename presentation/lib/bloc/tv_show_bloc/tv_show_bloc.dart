import 'package:domain/entities/category.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final GetAiringTodayTvShows _getAiringTodayTvShows;
  final GetPopularTvShows _getPopularTvShows;
  final GetTopRatedTvShows _getTopRatedTvShows;

  TvShowBloc(
    this._getAiringTodayTvShows,
    this._getPopularTvShows,
    this._getTopRatedTvShows,
  ) : super(TvShowState.initialState()) {
    on<FetchAiringTodayTvShows>(
      (event, emit) async {
        emit(
          state.copyWith(
            airingTodayTvShowsState: AiringTodayTvShowsLoading(),
          ),
        );

        final result = await _getAiringTodayTvShows.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                airingTodayTvShowsState:
                    AiringTodayTvShowsError(failure.message),
              ),
            );
          },
          (tvShowsData) {
            emit(
              state.copyWith(
                airingTodayTvShowsState: AiringTodayTvShowsData(tvShowsData),
              ),
            );
          },
        );
      },
    );

    on<FetchPopularTvShows>(
      (event, emit) async {
        emit(
          state.copyWith(
            popularTvShowsState: PopularTvShowsLoading(),
          ),
        );

        final result = await _getPopularTvShows.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                popularTvShowsState: PopularTvShowsError(failure.message),
              ),
            );
          },
          (tvShowsData) {
            emit(
              state.copyWith(
                popularTvShowsState: PopularTvShowsData(tvShowsData),
              ),
            );
          },
        );
      },
    );

    on<FetchTopRatedTvShows>(
      (event, emit) async {
        emit(
          state.copyWith(
            topRatedTvShowsState: TopRatedTvShowsLoading(),
          ),
        );

        final result = await _getTopRatedTvShows.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                topRatedTvShowsState: TopRatedTvShowsError(failure.message),
              ),
            );
          },
          (tvShowsData) {
            emit(
              state.copyWith(
                topRatedTvShowsState: TopRatedTvShowsData(tvShowsData),
              ),
            );
          },
        );
      },
    );
  }
}
