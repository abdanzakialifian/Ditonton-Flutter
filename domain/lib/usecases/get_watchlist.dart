import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/repositories/watchlist_repository.dart';

class GetWatchlist {
  final WatchlistRepository _watchlistRepository;

  GetWatchlist(this._watchlistRepository);

  Future<Either<Failure, List<Watchlist>>> execute() =>
      _watchlistRepository.getWatchlist();
}
