import 'package:ditonton/data/models/movie_detail_response.dart';
import 'package:ditonton/data/models/movie_result_response.dart';
import 'package:ditonton/data/models/tv_show_result_response.dart';

abstract class RemoteDataSource {
  Future<List<MovieResultResponse>> getNowPlayingMovies();
  Future<List<TvShowResultResponse>> getAiringTodayTvShow();
  Future<List<MovieResultResponse>> getPopularMovies();
  Future<List<MovieResultResponse>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieResultResponse>> getMovieRecommendations(int id);
  Future<List<MovieResultResponse>> searchMovies(String query);
}
