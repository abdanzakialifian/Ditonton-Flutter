import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvShowRecommendations {
  final TvShowRepository _tvShowRepository;

  GetTvShowRecommendations(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute(int id) =>
      _tvShowRepository.getTvShowRecommendations(id);
}
