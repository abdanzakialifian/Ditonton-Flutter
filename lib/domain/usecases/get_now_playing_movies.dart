import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository _movieRepository;

  GetNowPlayingMovies(this._movieRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _movieRepository.getNowPlayingMovies();
}
