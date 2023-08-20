import 'package:core/data/datasources/local/local_data_source.dart';
import 'package:core/data/models/watchlist_table.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:core/domain/repositories/watchlist_repository.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

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
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await _localDataSource.getWatchlistById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Watchlist>>> getWatchlist() async {
    final result = await _localDataSource.getWatchlists();
    return Right(result.map((data) => data.toWatchlist()).toList());
  }
}
