import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/detail.dart';
import 'package:domain/repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository _movieRepository;

  GetMovieDetail(this._movieRepository);

  Future<Either<Failure, Detail>> execute(int id) =>
      _movieRepository.getMovieDetail(id);
}
