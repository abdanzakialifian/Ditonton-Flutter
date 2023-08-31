import 'package:core/exception.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/models/watchlist_table.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/repositories/watchlist_repository.dart';

class WatchlistRepositoryImpl extends WatchlistRepository {
  final LocalDataSource _localDataSource;

  WatchlistRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, String>> saveWatchlist(Watchlist watchlist) async {
    try {
      final result = await _localDataSource
          .insertWatchlist(WatchlistTable.fromWatchlist(watchlist));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(Watchlist watchlist) async {
    try {
      final result = await _localDataSource
          .removeWatchlist(WatchlistTable.fromWatchlist(watchlist));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isAddedToWatchlist(int id) async {
    try {
      final result = await _localDataSource.getWatchlistById(id);
      return Right(result != null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Watchlist>>> getWatchlist() async {
    final result = await _localDataSource.getWatchlists();
    return Right(result.map((data) => data.toWatchlist()).toList());
  }
}
