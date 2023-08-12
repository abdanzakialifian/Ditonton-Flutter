import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class RemoveWatchlistTvShow {
  final TvShowRepository _tvShowRepository;

  RemoveWatchlistTvShow(this._tvShowRepository);

  Future<Either<Failure, String>> execute(TvShowDetail tvShow) {
    return _tvShowRepository.removeWatchlistTvShow(tvShow);
  }
}
