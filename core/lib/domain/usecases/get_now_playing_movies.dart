import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository _movieRepository;

  GetNowPlayingMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _movieRepository.getNowPlayingMovies();
}
