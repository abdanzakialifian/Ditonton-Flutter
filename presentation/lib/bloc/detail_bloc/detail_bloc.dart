import 'package:domain/entities/category.dart';
import 'package:domain/entities/detail.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_tv_show_detail.dart';
import 'package:domain/usecases/get_tv_show_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailContainerState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  final GetTvShowDetail _getTvShowDetail;
  final GetTvShowRecommendations _getTvShowRecommendations;

  DetailBloc(
    this._getMovieDetail,
    this._getMovieRecommendations,
    this._getTvShowDetail,
    this._getTvShowRecommendations,
  ) : super(DetailContainerState.initialState()) {
    on<FetchMovieDetail>(
      (event, emit) async {
        emit(
          state.copyWith(
            detailState: DetailLoading(),
          ),
        );

        final detailResult = await _getMovieDetail.execute(event.movieId);
        final recommendationResult =
            await _getMovieRecommendations.execute(event.movieId);

        detailResult.fold(
          (failure) {
            emit(
              state.copyWith(
                detailState: DetailError(failure.message),
              ),
            );
          },
          (movie) {
            emit(
              state.copyWith(
                recommendationState: RecommendationLoading(),
              ),
            );
            recommendationResult.fold(
              (failure) {
                emit(
                  state.copyWith(
                    recommendationState: RecommendationError(failure.message),
                  ),
                );
              },
              (movies) {
                if (movies.isNotEmpty) {
                  emit(
                    state.copyWith(
                      recommendationState: RecommendationData(movies),
                    ),
                  );
                } else {
                  emit(
                    state.copyWith(
                      recommendationState: RecommendationEmpty(),
                    ),
                  );
                }
              },
            );
            emit(
              state.copyWith(
                detailState: DetailData(movie),
              ),
            );
          },
        );
      },
    );

    on<FetchTvShowDetail>(
      (event, emit) async {
        emit(
          state.copyWith(
            detailState: DetailLoading(),
          ),
        );

        final detailResult = await _getTvShowDetail.execute(event.tvShowId);
        final recommendationResult =
            await _getTvShowRecommendations.execute(event.tvShowId);

        detailResult.fold(
          (failure) {
            emit(
              state.copyWith(
                detailState: DetailError(failure.message),
              ),
            );
          },
          (tvShow) {
            emit(
              state.copyWith(
                recommendationState: RecommendationLoading(),
              ),
            );
            recommendationResult.fold(
              (failure) {
                emit(
                  state.copyWith(
                    recommendationState: RecommendationError(failure.message),
                  ),
                );
              },
              (tvShows) {
                if (tvShows.isNotEmpty) {
                  emit(
                    state.copyWith(
                      recommendationState: RecommendationData(tvShows),
                    ),
                  );
                } else {
                  emit(
                    state.copyWith(
                      recommendationState: RecommendationEmpty(),
                    ),
                  );
                }
              },
            );
            emit(
              state.copyWith(
                detailState: DetailData(tvShow),
              ),
            );
          },
        );
      },
    );
  }
}
