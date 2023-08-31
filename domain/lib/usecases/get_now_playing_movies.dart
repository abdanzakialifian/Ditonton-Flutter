import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository _movieRepository;

  GetNowPlayingMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _movieRepository.getNowPlayingMovies();
}
