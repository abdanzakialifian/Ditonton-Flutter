import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlist saveWatchlist;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    saveWatchlist = SaveWatchlist(mockWatchlistRepository);
  });

  final WatchlistTable dummyWatchlistTable = WatchlistTable(
    id: 1,
    title: "Title",
    posterPath: "Poster Path",
    overview: "Overview",
    category: "Movie or Tv Show",
  );

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  test('should save watchlist to the repository', () async {
    // arrange
    when(mockWatchlistRepository.saveWatchlist(dummyWatchlist))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await saveWatchlist.execute(dummyWatchlist);
    // assert
    verify(mockWatchlistRepository.saveWatchlist(dummyWatchlist));
    expect(result, isRightThat('Added to Watchlist'));
  });
}
