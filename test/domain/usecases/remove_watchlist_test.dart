import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/usecases/remove_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlist removeWatchlist;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    removeWatchlist = RemoveWatchlist(mockWatchlistRepository);
  });

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  test('should remove watchlist watchlist from repository', () async {
    // arrange
    when(mockWatchlistRepository.removeWatchlist(dummyWatchlist))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await removeWatchlist.execute(dummyWatchlist);
    // assert
    verify(mockWatchlistRepository.removeWatchlist(dummyWatchlist));
    expect(result, isRightThat('Removed from watchlist'));
  });
}
