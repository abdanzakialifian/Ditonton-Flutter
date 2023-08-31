import 'dart:io';
import 'package:core/exception.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasources/remote/remote_data_source.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/entities/detail.dart';
import 'package:domain/repositories/tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final RemoteDataSource _remoteDataSource;

  TvShowRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAiringTodayTvShows() async {
    try {
      final result = await _remoteDataSource.getAiringTodayTvShows();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getPopularTvShows() async {
    try {
      final result = await _remoteDataSource.getPopularTvShows();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getTopRatedTvShows() async {
    try {
      final result = await _remoteDataSource.getTopRatedTvShows();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, Detail>> getTvShowDetail(int id) async {
    try {
      final result = await _remoteDataSource.getTvShowDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getTvShowRecommendations(
      int id) async {
    try {
      final result = await _remoteDataSource.getTvShowRecommendations(id);
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> searchTvShows(String query) async {
    try {
      final result = await _remoteDataSource.searchTvShows(query);
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
