import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _movieRepository;

  GetWatchlistMovies(this._movieRepository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _movieRepository.getWatchlistMovies();
  }
}
