import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/tv_show_repository.dart';

class GetTvShowRecommendations {
  final TvShowRepository _tvShowRepository;

  GetTvShowRecommendations(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute(int id) =>
      _tvShowRepository.getTvShowRecommendations(id);
}
