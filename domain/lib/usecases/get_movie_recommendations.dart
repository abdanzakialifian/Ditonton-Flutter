import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetMovieRecommendations {
  final MovieRepository _movieRepository;

  GetMovieRecommendations(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute(id) =>
      _movieRepository.getMovieRecommendations(id);
}
