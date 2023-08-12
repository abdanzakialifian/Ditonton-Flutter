import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetMovieDetail {
  final MovieRepository _movieRepository;

  GetMovieDetail(this._movieRepository);

  Future<Either<Failure, Detail>> execute(int id) =>
      _movieRepository.getMovieDetail(id);
}
