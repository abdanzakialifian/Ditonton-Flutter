import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetAiringTodayTvShows {
  final TvShowRepository _tvShowRepository;

  GetAiringTodayTvShows(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute() =>
      _tvShowRepository.getAiringTodayTvShows();
}
