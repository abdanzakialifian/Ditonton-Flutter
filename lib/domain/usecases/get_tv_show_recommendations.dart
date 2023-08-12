import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowRecommendations {
  final TvShowRepository _tvShowRepository;

  GetTvShowRecommendations(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute(int id) =>
      _tvShowRepository.getTvShowRecommendations(id);
}
