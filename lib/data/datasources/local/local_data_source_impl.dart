import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/local/db/database_helper.dart';
import 'package:ditonton/data/datasources/local/local_data_source.dart';
import 'package:ditonton/data/models/watchlist_table.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(WatchlistTable watchlistTable) async {
    try {
      await databaseHelper.insertWatchlist(watchlistTable);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(WatchlistTable watchlistTable) async {
    try {
      await databaseHelper.removeWatchlist(watchlistTable);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<WatchlistTable?> getWatchlistById(int id) async {
    final result = await databaseHelper.getWatchlistById(id);
    if (result != null) {
      return WatchlistTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<WatchlistTable>> getWatchlists() async {
    final result = await databaseHelper.getWatchlist();
    return result.map((data) => WatchlistTable.fromMap(data)).toList();
  }
}
