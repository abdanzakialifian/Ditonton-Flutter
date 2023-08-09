import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository _movieRepository;

  SaveWatchlist(this._movieRepository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return _movieRepository.saveWatchlist(movie);
  }
}
