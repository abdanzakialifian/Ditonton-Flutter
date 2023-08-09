import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository _movieRepository;

  GetNowPlayingMovies(this._movieRepository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _movieRepository.getNowPlayingMovies();
  }
}
