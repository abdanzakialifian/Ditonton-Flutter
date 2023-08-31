import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/repositories/watchlist_repository.dart';

class SaveWatchlist {
  final WatchlistRepository _watchlistRepository;

  SaveWatchlist(this._watchlistRepository);

  Future<Either<Failure, String>> execute(Watchlist watchlist) =>
      _watchlistRepository.saveWatchlist(watchlist);
}
