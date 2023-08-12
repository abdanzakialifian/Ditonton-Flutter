import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowDetail {
  final TvShowRepository _tvShowRepository;

  GetTvShowDetail(this._tvShowRepository);

  Future<Either<Failure, Detail>> execute(int id) =>
      _tvShowRepository.getTvShowDetail(id);
}
