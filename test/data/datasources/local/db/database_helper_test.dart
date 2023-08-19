import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late Database database;
  late MockDatabaseHelper mockDatabaseHelper;
  const String _tblWatchlist = 'watchlist';

  setUpAll(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await database.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        category TEXT,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
    mockDatabaseHelper = MockDatabaseHelper();
    mockDatabaseHelper.setDatabase = database;
  });

  test('should return 1 to successfully insert database', () async {
    // arrange
    when(mockDatabaseHelper.insertWatchlist(dummyWatchlistTable))
        .thenAnswer((_) async => 1);
    // act
    final result =
        await database.insert(_tblWatchlist, dummyWatchlistTable.toJson());
    // assert
    verifyNever(mockDatabaseHelper.insertWatchlist(dummyWatchlistTable));
    expect(await mockDatabaseHelper.insertWatchlist(dummyWatchlistTable), 1);
    expect(result, 1);
  });

  test('should return 1 to successfully remove data in database', () async {
    // arrange
    when(mockDatabaseHelper.removeWatchlist(dummyWatchlistTable))
        .thenAnswer((_) async => 1);
    // act
    await database.insert(_tblWatchlist, dummyWatchlistTable.toJson());
    final result = await database.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [dummyWatchlistTable.id],
    );
    // assert
    verifyNever(mockDatabaseHelper.removeWatchlist(dummyWatchlistTable));
    expect(await mockDatabaseHelper.removeWatchlist(dummyWatchlistTable), 1);
    expect(result, 1);
  });

  test('should return map data type if successfully get watchlist by id',
      () async {
    // arrange
    when(mockDatabaseHelper.getWatchlistById(dummyWatchlistTable.id))
        .thenAnswer(
      (_) async => dummyWatchlistMap,
    );
    // act
    await database.insert(_tblWatchlist, dummyWatchlistTable.toJson());
    final result = await database.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [dummyWatchlistTable.id],
    );
    // assert
    verifyNever(mockDatabaseHelper.getWatchlistById(dummyWatchlistTable.id));
    expect(await mockDatabaseHelper.getWatchlistById(dummyWatchlistTable.id),
        dummyWatchlistMap);
    expect(result.first, dummyWatchlistMap);
  });

  test('should return map data type if successfully get watchlist', () async {
    // arrange
    when(mockDatabaseHelper.getWatchlist()).thenAnswer(
      (_) async => [dummyWatchlistMap],
    );
    // act
    await database.insert(_tblWatchlist, dummyWatchlistTable.toJson());
    final results = await database.query(_tblWatchlist);
    // assert
    verifyNever(mockDatabaseHelper.getWatchlist());
    expect(await mockDatabaseHelper.getWatchlist(), [dummyWatchlistMap]);
    expect(results, [dummyWatchlistMap]);
  });

  test('sqflite version', () async {
    expect(await database.getVersion(), 0);
  });

  test('Close db', () async {
    await database.close();
    expect(database.isOpen, false);
  });
}
