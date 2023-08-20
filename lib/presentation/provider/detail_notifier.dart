import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:flutter/foundation.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class DetailNotifier extends ChangeNotifier {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetTvShowDetail getTvShowDetail;
  final GetTvShowRecommendations getTvShowRecommendations;

  DetailNotifier({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getTvShowDetail,
    required this.getTvShowRecommendations,
  });

  late Detail _detail;
  Detail get detail => _detail;

  RequestState _detailState = RequestState.empty;
  RequestState get detailState => _detailState;

  List<category.Category> _recommendations = [];
  List<category.Category> get recommendations => _recommendations;

  RequestState _recommendationState = RequestState.empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieDetail(int id) async {
    _detailState = RequestState.loading;
    notifyListeners();
    final detailResult = await getMovieDetail.execute(id);
    final recommendationResult = await getMovieRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _detailState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (movie) {
        _recommendationState = RequestState.loading;
        _detail = movie;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.error;
            _message = failure.message;
          },
          (movies) {
            if (movies.isNotEmpty) {
              _recommendationState = RequestState.loaded;
              _recommendations = movies;
            } else {
              _recommendationState = RequestState.empty;
              _recommendations = movies;
            }
          },
        );
        _detailState = RequestState.loaded;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvShowDetail(int id) async {
    _detailState = RequestState.loading;
    notifyListeners();
    final detailResult = await getTvShowDetail.execute(id);
    final recommendationResult = await getTvShowRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _detailState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShow) {
        _recommendationState = RequestState.loading;
        _detail = tvShow;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.error;
            _message = failure.message;
          },
          (tvShows) {
            if (tvShows.isNotEmpty) {
              _recommendationState = RequestState.loaded;
              _recommendations = tvShows;
            } else {
              _recommendationState = RequestState.empty;
              _recommendations = tvShows;
            }
          },
        );
        _detailState = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
