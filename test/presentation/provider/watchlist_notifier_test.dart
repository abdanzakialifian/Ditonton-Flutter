import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_watchlist.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_notifier_test.mocks.dart';

@GenerateMocks(
    [GetWatchlist, GetWatchListStatus, RemoveWatchlist, SaveWatchlist])
void main() {
  late WatchlistNotifier watchlistNotifier;
  late MockGetWatchlist mockGetWatchlist;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockSaveWatchlist mockSaveWatchlist;

  setUp(() {
    mockGetWatchlist = MockGetWatchlist();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockSaveWatchlist = MockSaveWatchlist();
    watchlistNotifier = WatchlistNotifier(
      getWatchlist: mockGetWatchlist,
      getWatchListStatus: mockGetWatchListStatus,
      removeWatchlist: mockRemoveWatchlist,
      saveWatchlist: mockSaveWatchlist,
    );
  });

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  group('Watchlist', () {
    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetWatchlist.execute())
          .thenAnswer((_) async => Right([dummyWatchlist]));
      // act
      await watchlistNotifier.fetchWatchlist();
      // assert
      expect(watchlistNotifier.watchlistState, RequestState.loaded);
      expect(watchlistNotifier.watchlist, [dummyWatchlist]);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetWatchlist.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't get data")));
      // act
      await watchlistNotifier.fetchWatchlist();
      // assert
      expect(watchlistNotifier.watchlistState, RequestState.error);
      expect(watchlistNotifier.message, "Can't get data");
    });

    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchListStatus.execute(1))
          .thenAnswer((_) async => const Right(true));
      // act
      await watchlistNotifier.loadWatchlistStatus(1);
      // assert
      expect(watchlistNotifier.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlist.execute(dummyWatchlist))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchListStatus.execute(dummyWatchlist.id))
          .thenAnswer((_) async => const Right(true));
      // act
      await watchlistNotifier.addWatchlist(dummyWatchlist);
      // assert
      verify(mockSaveWatchlist.execute(dummyWatchlist));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist.execute(dummyWatchlist))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchListStatus.execute(dummyWatchlist.id))
          .thenAnswer((_) async => const Right(false));
      // act
      await watchlistNotifier.removeFromWatchlist(dummyWatchlist);
      // assert
      verify(mockRemoveWatchlist.execute(dummyWatchlist));
    });

    test('should return error when remove watchlist is unsuccessful', () async {
      // arrange
      when(mockRemoveWatchlist.execute(dummyWatchlist)).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't remove data")));
      when(mockGetWatchListStatus.execute(1))
          .thenAnswer((_) async => const Right(false));
      // act
      await watchlistNotifier.removeFromWatchlist(dummyWatchlist);
      // assert
      expect(watchlistNotifier.watchlistMessage, "Can't remove data");
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist.execute(dummyWatchlist))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetWatchListStatus.execute(dummyWatchlist.id))
          .thenAnswer((_) async => const Right(true));
      // act
      await watchlistNotifier.addWatchlist(dummyWatchlist);
      // assert
      verify(mockGetWatchListStatus.execute(dummyWatchlist.id));
      expect(watchlistNotifier.isAddedToWatchlist, true);
      expect(watchlistNotifier.watchlistMessage, 'Added to Watchlist');
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist.execute(dummyWatchlist))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(mockGetWatchListStatus.execute(dummyWatchlist.id))
          .thenAnswer((_) async => const Right(false));
      // act
      await watchlistNotifier.addWatchlist(dummyWatchlist);
      // assert
      expect(watchlistNotifier.watchlistMessage, 'Failed');
    });
  });
}
