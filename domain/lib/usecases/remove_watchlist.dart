import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/repositories/watchlist_repository.dart';

class RemoveWatchlist {
  final WatchlistRepository _watchlistRepository;

  RemoveWatchlist(this._watchlistRepository);

  Future<Either<Failure, String>> execute(Watchlist watchlist) =>
      _watchlistRepository.removeWatchlist(watchlist);
}
