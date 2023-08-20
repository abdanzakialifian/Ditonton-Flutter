import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/datasources/remote/remote_data_source.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getNowPlayingMovies() async {
    try {
      final result = await _remoteDataSource.getNowPlayingMovies();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Detail>> getMovieDetail(int id) async {
    try {
      final result = await _remoteDataSource.getMovieDetail(id);
      return Right(result.toDetail());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getMovieRecommendations(
      int id) async {
    try {
      final result = await _remoteDataSource.getMovieRecommendations(id);
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getPopularMovies() async {
    try {
      final result = await _remoteDataSource.getPopularMovies();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getTopRatedMovies() async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies();
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> searchMovies(String query) async {
    try {
      final result = await _remoteDataSource.searchMovies(query);
      return Right(result.map((model) => model.toCategory()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
