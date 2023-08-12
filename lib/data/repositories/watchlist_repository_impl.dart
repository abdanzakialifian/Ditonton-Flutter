import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/local/local_data_source.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class WatchlistRepositoryImpl extends WatchlistRepository {
  final LocalDataSource localDataSource;

  WatchlistRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, String>> saveWatchlist(Watchlist watchlist) async {
    try {
      final result = await localDataSource
          .insertWatchlist(WatchlistTable.fromEntity(watchlist));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(Watchlist watchlist) async {
    try {
      final result = await localDataSource
          .removeWatchlist(WatchlistTable.fromEntity(watchlist));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getWatchlistById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Watchlist>>> getWatchlist() async {
    final result = await localDataSource.getWatchlists();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
