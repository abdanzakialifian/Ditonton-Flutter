import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTopRatedTvShows {
  final TvShowRepository _tvShowRepository;

  GetTopRatedTvShows(this._tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return _tvShowRepository.getTopRatedTvShows();
  }
}
