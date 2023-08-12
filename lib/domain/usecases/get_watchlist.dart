import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchlist {
  final WatchlistRepository _watchlistRepository;

  GetWatchlist(this._watchlistRepository);

  Future<Either<Failure, List<Watchlist>>> execute() {
    return _watchlistRepository.getWatchlist();
  }
}
