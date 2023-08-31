import 'package:data/models/watchlist_table.dart';

abstract class LocalDataSource {
  Future<String> insertWatchlist(WatchlistTable watchlistTable);
  Future<String> removeWatchlist(WatchlistTable watchlistTable);
  Future<WatchlistTable?> getWatchlistById(int id);
  Future<List<WatchlistTable>> getWatchlists();
}
