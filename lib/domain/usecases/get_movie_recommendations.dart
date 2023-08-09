import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository _movieRepository;

  GetMovieRecommendations(this._movieRepository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return _movieRepository.getMovieRecommendations(id);
  }
}
