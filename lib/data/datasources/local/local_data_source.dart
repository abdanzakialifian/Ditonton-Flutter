import 'package:ditonton/data/models/watchlist_table.dart';

abstract class LocalDataSource {
  Future<String> insertWatchlist(WatchlistTable movie);
  Future<String> removeWatchlist(WatchlistTable movie);
  Future<WatchlistTable?> getWatchlistById(int id);
  Future<List<WatchlistTable>> getWatchlists();
}
