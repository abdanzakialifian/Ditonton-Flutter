import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/remote/remote_data_source.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final RemoteDataSource remoteDataSource;

  TvShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TvShow>>> getAiringTodayTvShows() async {
    try {
      final result = await remoteDataSource.getAiringTodayTvShow();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(""));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}
