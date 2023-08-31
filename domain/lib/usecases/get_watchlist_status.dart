import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/repositories/watchlist_repository.dart';

class GetWatchListStatus {
  final WatchlistRepository _watchlistRepository;

  GetWatchListStatus(this._watchlistRepository);

  Future<Either<Failure, bool>> execute(int id) async =>
      _watchlistRepository.isAddedToWatchlist(id);
}
