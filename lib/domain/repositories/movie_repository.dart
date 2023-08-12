import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/common/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Category>>> getNowPlayingMovies();
  Future<Either<Failure, List<Category>>> getPopularMovies();
  Future<Either<Failure, List<Category>>> getTopRatedMovies();
  Future<Either<Failure, Detail>> getMovieDetail(int id);
  Future<Either<Failure, List<Category>>> getMovieRecommendations(int id);
  Future<Either<Failure, List<Category>>> searchMovies(String query);
}
