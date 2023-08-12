import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetPopularTvShows {
  final TvShowRepository _tvShowRepository;

  GetPopularTvShows(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _tvShowRepository.getPopularTvShows();
}
