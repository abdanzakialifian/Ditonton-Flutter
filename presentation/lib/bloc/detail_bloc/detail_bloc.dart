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

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  final GetTvShowDetail _getTvShowDetail;
  final GetTvShowRecommendations _getTvShowRecommendations;

  DetailBloc(
    this._getMovieDetail,
    this._getMovieRecommendations,
    this._getTvShowDetail,
    this._getTvShowRecommendations,
  ) : super(DetailEmpty()) {
    on<FetchMovieDetail>(
      (event, emit) async {
        emit(DetailLoading());

        final detailResult = await _getMovieDetail.execute(event.movieId);
        final recommendationResult =
            await _getMovieRecommendations.execute(event.movieId);
        DetailState recommendationState;

        detailResult.fold(
          (failure) {
            emit(DetailError(failure.message));
          },
          (movie) {
            recommendationState = RecommendationLoading();
            recommendationResult.fold(
              (failure) {
                recommendationState = RecommendationError(failure.message);
              },
              (movies) {
                if (movies.isNotEmpty) {
                  recommendationState = RecommendationData(movies);
                } else {
                  recommendationState = RecommendationEmpty();
                }
              },
            );
            emit(DetailData(movie, recommendationState));
          },
        );
      },
    );

    on<FetchTvShowDetail>(
      (event, emit) async {
        emit(DetailLoading());

        final detailResult = await _getTvShowDetail.execute(event.tvShowId);
        final recommendationResult =
            await _getTvShowRecommendations.execute(event.tvShowId);
        DetailState recommendationState;

        detailResult.fold(
          (failure) {
            emit(DetailError(failure.message));
          },
          (tvShow) {
            recommendationState = RecommendationLoading();
            recommendationResult.fold(
              (failure) {
                recommendationState = RecommendationError(failure.message);
              },
              (tvShows) {
                if (tvShows.isNotEmpty) {
                  recommendationState = RecommendationData(tvShows);
                } else {
                  recommendationState = RecommendationEmpty();
                }
              },
            );
            emit(DetailData(tvShow, recommendationState));
          },
        );
      },
    );
  }
}
