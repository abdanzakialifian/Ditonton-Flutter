import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/tv_show_repository.dart';

class GetTopRatedTvShows {
  final TvShowRepository _tvShowRepository;

  GetTopRatedTvShows(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _tvShowRepository.getTopRatedTvShows();
}
