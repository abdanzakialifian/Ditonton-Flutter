import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/entities/detail.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Category>>> getNowPlayingMovies();
  Future<Either<Failure, List<Category>>> getPopularMovies();
  Future<Either<Failure, List<Category>>> getTopRatedMovies();
  Future<Either<Failure, Detail>> getMovieDetail(int id);
  Future<Either<Failure, List<Category>>> getMovieRecommendations(int id);
  Future<Either<Failure, List<Category>>> searchMovies(String query);
}
