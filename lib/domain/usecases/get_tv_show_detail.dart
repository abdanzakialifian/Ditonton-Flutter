import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowDetail {
  final TvShowRepository _tvShowRepository;

  GetTvShowDetail(this._tvShowRepository);

  Future<Either<Failure, TvShowDetail>> execute(int id) {
    return _tvShowRepository.getTvShowDetail(id);
  }
}
