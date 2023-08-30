import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchListStatus {
  final WatchlistRepository _watchlistRepository;

  GetWatchListStatus(this._watchlistRepository);

  Future<Either<Failure, bool>> execute(int id) async =>
      _watchlistRepository.isAddedToWatchlist(id);
}
