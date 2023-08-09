import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetMovieDetail {
  final MovieRepository _movieRepository;

  GetMovieDetail(this._movieRepository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return _movieRepository.getMovieDetail(id);
  }
}
