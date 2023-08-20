import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/entities/detail.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<Category>>> getAiringTodayTvShows();
  Future<Either<Failure, List<Category>>> getPopularTvShows();
  Future<Either<Failure, List<Category>>> getTopRatedTvShows();
  Future<Either<Failure, Detail>> getTvShowDetail(int id);
  Future<Either<Failure, List<Category>>> getTvShowRecommendations(int id);
  Future<Either<Failure, List<Category>>> searchTvShows(String query);
}
