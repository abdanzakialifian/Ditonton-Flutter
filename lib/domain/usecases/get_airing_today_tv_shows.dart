import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetAiringTodayTvShows {
  final TvShowRepository tvShowRepository;

  GetAiringTodayTvShows(this.tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return tvShowRepository.getAiringTodayTvShows();
  }
}
