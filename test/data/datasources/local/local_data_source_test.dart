import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/local/local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late LocalDataSourceImpl localDataSourceImpl;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    localDataSourceImpl =
        LocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('Insert Watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(dummyWatchlistTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await localDataSourceImpl.insertWatchlist(dummyWatchlistTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(dummyWatchlistTable))
          .thenThrow(Exception());
      // act
      final result = localDataSourceImpl.insertWatchlist(dummyWatchlistTable);
      // assert
      expect(result, throwsA(isA<DatabaseException>()));
    });
  });

  group('Remove Watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(dummyWatchlistTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await localDataSourceImpl.removeWatchlist(dummyWatchlistTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(dummyWatchlistTable))
          .thenThrow(Exception());
      // act
      final call = localDataSourceImpl.removeWatchlist(dummyWatchlistTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Watchlist List By Id', () {
    final tId = 1;

    test('should return watchlist by id when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(tId))
          .thenAnswer((_) async => dummyWatchlistJson);
      // act
      final result = await localDataSourceImpl.getWatchlistById(tId);
      // assert
      expect(result, dummyWatchlistTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await localDataSourceImpl.getWatchlistById(tId);
      // assert
      expect(result, null);
    });
  });

  group('Get Watchlist', () {
    test('should return list of watchlist from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlist())
          .thenAnswer((_) async => [dummyWatchlistJson]);
      // act
      final result = await localDataSourceImpl.getWatchlists();
      // assert
      expect(result, [dummyWatchlistTable]);
    });

    test('should return empty list of watchlist from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlist()).thenAnswer((_) async => []);
      // act
      final result = await localDataSourceImpl.getWatchlists();
      // assert
      expect(result, []);
    });
  });
}
