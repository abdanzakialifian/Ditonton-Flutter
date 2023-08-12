import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository _movieRepository;

  GetTopRatedMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _movieRepository.getTopRatedMovies();
}
