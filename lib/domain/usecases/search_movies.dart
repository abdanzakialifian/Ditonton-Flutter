import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository _movieRepository;

  SearchMovies(this._movieRepository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return _movieRepository.searchMovies(query);
  }
}
