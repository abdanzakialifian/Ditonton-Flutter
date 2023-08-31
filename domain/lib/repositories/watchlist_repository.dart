import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/watchlist.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, String>> saveWatchlist(Watchlist watchlist);
  Future<Either<Failure, String>> removeWatchlist(Watchlist watchlist);
  Future<Either<Failure, bool>> isAddedToWatchlist(int id);
  Future<Either<Failure, List<Watchlist>>> getWatchlist();
}
