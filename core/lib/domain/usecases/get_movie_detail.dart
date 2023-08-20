import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/detail.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/utils/failure.dart';

class GetMovieDetail {
  final MovieRepository _movieRepository;

  GetMovieDetail(this._movieRepository);

  Future<Either<Failure, Detail>> execute(int id) =>
      _movieRepository.getMovieDetail(id);
}
