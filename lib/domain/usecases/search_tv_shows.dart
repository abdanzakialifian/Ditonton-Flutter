import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SearchTvShows {
  final TvShowRepository _tvShowRepository;

  SearchTvShows(this._tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute(String query) {
    return _tvShowRepository.searchMovies(query);
  }
}
