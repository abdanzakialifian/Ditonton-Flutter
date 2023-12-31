import 'dart:async';

import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  Database? setDatabase;

  Future<Database?> get database async {
    setDatabase ??= await _initDb();
    return setDatabase;
  }

  static const String _tblWatchlist = 'watchlist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        category TEXT,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlist(WatchlistTable watchlistTable) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, watchlistTable.toJson());
  }

  Future<int> removeWatchlist(WatchlistTable watchlistTable) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [watchlistTable.id],
    );
  }

  Future<Map<String, dynamic>?> getWatchlistById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlist() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results;
  }
}
