import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/tv_show_repository.dart';

class SearchTvShows {
  final TvShowRepository _tvShowRepository;

  SearchTvShows(this._tvShowRepository);

  Future<Either<Failure, List<Category>>> execute(String query) =>
      _tvShowRepository.searchTvShows(query);
}
