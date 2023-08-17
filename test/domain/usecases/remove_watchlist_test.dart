import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlist removeWatchlist;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    removeWatchlist = RemoveWatchlist(mockWatchlistRepository);
  });

  final WatchlistTable dummyWatchlistTable = WatchlistTable(
    id: 1,
    title: "Title",
    posterPath: "Poster Path",
    overview: "Overview",
    category: "Movie or Tv Show",
  );

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  test('should remove watchlist watchlist from repository', () async {
    // arrange
    when(mockWatchlistRepository.removeWatchlist(dummyWatchlist))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await removeWatchlist.execute(dummyWatchlist);
    // assert
    verify(mockWatchlistRepository.removeWatchlist(dummyWatchlist));
    expect(result, isRightThat('Removed from watchlist'));
  });
}
