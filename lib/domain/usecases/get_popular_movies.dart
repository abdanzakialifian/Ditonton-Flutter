import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository _movieRepository;

  GetPopularMovies(this._movieRepository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _movieRepository.getPopularMovies();
  }
}
