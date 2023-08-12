import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository _movieRepository;

  GetMovieRecommendations(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute(id) =>
      _movieRepository.getMovieRecommendations(id);
}
