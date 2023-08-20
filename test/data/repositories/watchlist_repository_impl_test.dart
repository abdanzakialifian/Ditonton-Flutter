import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/watchlist_repository_impl.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistRepositoryImpl watchlistRepositoryImpl;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    watchlistRepositoryImpl = WatchlistRepositoryImpl(mockLocalDataSource);
  });

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  group('Save Watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(dummyWatchlistTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result =
          await watchlistRepositoryImpl.saveWatchlist(dummyWatchlist);
      // assert
      verify(mockLocalDataSource.insertWatchlist(dummyWatchlistTable));
      expect(result, isRightThat('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(dummyWatchlistTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result =
          await watchlistRepositoryImpl.saveWatchlist(dummyWatchlist);
      // assert
      verify(mockLocalDataSource.insertWatchlist(dummyWatchlistTable));
      expect(
          result, isLeftThat(const DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('Remove Watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(dummyWatchlistTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result =
          await watchlistRepositoryImpl.removeWatchlist(dummyWatchlist);
      // assert
      verify(mockLocalDataSource.removeWatchlist(dummyWatchlistTable));
      expect(result, isRightThat('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(dummyWatchlistTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result =
          await watchlistRepositoryImpl.removeWatchlist(dummyWatchlist);
      // assert
      verify(mockLocalDataSource.removeWatchlist(dummyWatchlistTable));
      expect(result,
          isLeftThat(const DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('Get Watchlist Status', () {
    test('should return true watch status whether data is found', () async {
      // arrange
      const dummyWatchlistId = 1;
      when(mockLocalDataSource.getWatchlistById(dummyWatchlistId))
          .thenAnswer((_) async => dummyWatchlistTable);
      // act
      final result =
          await watchlistRepositoryImpl.isAddedToWatchlist(dummyWatchlistId);
      // assert
      verify(mockLocalDataSource.getWatchlistById(dummyWatchlistId));
      expect(result, true);
    });

    test('should return false watch status whether data is not found',
        () async {
      // arrange
      const dummyWatchlistId = 1;
      when(mockLocalDataSource.getWatchlistById(dummyWatchlistId))
          .thenAnswer((_) async => null);
      // act
      final result =
          await watchlistRepositoryImpl.isAddedToWatchlist(dummyWatchlistId);
      // assert
      verify(mockLocalDataSource.getWatchlistById(dummyWatchlistId));
      expect(result, false);
    });
  });

  group('Get Watchlist', () {
    test('should return list not empty', () async {
      // arrange
      when(mockLocalDataSource.getWatchlists())
          .thenAnswer((_) async => [dummyWatchlistTable]);
      // act
      final result = await watchlistRepositoryImpl.getWatchlist();
      // assert
      verify(mockLocalDataSource.getWatchlists());
      expect(result, isRightThat([dummyWatchlist]));
    });

    test('should return list empty', () async {
      // arrange
      when(mockLocalDataSource.getWatchlists()).thenAnswer((_) async => []);
      // act
      final result = await watchlistRepositoryImpl.getWatchlist();
      // assert
      verify(mockLocalDataSource.getWatchlists());
      expect(result, isRightThat([]));
    });
  });
}
