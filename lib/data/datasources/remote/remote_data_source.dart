import 'package:ditonton/data/models/movie/movie_result_response.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_result_response.dart';
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';

abstract class RemoteDataSource {
  Future<List<MovieResultResponse>> getNowPlayingMovies();
  Future<List<TvShowResultResponse>> getAiringTodayTvShows();
  Future<List<MovieResultResponse>> getPopularMovies();
  Future<List<TvShowResultResponse>> getPopularTvShows();
  Future<List<MovieResultResponse>> getTopRatedMovies();
  Future<List<TvShowResultResponse>> getTopRatedTvShows();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<TvShowDetailResponse> getTvShowDetail(int id);
  Future<List<MovieResultResponse>> getMovieRecommendations(int id);
  Future<List<TvShowResultResponse>> getTvShowRecommendations(int id);
  Future<List<MovieResultResponse>> searchMovies(String query);
  Future<List<TvShowResultResponse>> searchTvShows(String query);
}
