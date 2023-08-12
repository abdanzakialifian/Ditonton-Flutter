import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchListStatus {
  final WatchlistRepository _watchlistRepository;

  GetWatchListStatus(this._watchlistRepository);

  Future<bool> execute(int id) async =>
      _watchlistRepository.isAddedToWatchlist(id);
}
