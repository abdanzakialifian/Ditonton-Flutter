import 'package:core/exception.dart';
import 'package:data/datasources/local/db/database_helper.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/models/watchlist_table.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper _databaseHelper;

  LocalDataSourceImpl(this._databaseHelper);

  @override
  Future<String> insertWatchlist(WatchlistTable watchlistTable) async {
    try {
      await _databaseHelper.insertWatchlist(watchlistTable);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(WatchlistTable watchlistTable) async {
    try {
      await _databaseHelper.removeWatchlist(watchlistTable);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<WatchlistTable?> getWatchlistById(int id) async {
    final result = await _databaseHelper.getWatchlistById(id);
    if (result != null) {
      return WatchlistTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<WatchlistTable>> getWatchlists() async {
    final result = await _databaseHelper.getWatchlist();
    return result.map((data) => WatchlistTable.fromMap(data)).toList();
  }
}
