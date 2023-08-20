import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/detail.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvShowDetail {
  final TvShowRepository _tvShowRepository;

  GetTvShowDetail(this._tvShowRepository);

  Future<Either<Failure, Detail>> execute(int id) =>
      _tvShowRepository.getTvShowDetail(id);
}
