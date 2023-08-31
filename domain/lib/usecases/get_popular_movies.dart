import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository _movieRepository;

  GetPopularMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _movieRepository.getPopularMovies();
}