import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class SaveWatchlist {
  final WatchlistRepository _watchlistRepository;

  SaveWatchlist(this._watchlistRepository);

  Future<Either<Failure, String>> execute(Watchlist watchlist) =>
      _watchlistRepository.saveWatchlist(watchlist);
}
