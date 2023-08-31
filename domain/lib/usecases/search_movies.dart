import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository _movieRepository;

  SearchMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute(String query) =>
      _movieRepository.searchMovies(query);
}
