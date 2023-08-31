import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/usecases/save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlist saveWatchlist;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    saveWatchlist = SaveWatchlist(mockWatchlistRepository);
  });

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  test('should save watchlist to the repository', () async {
    // arrange
    when(mockWatchlistRepository.saveWatchlist(dummyWatchlist))
        .thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await saveWatchlist.execute(dummyWatchlist);
    // assert
    verify(mockWatchlistRepository.saveWatchlist(dummyWatchlist));
    expect(result, isRightThat('Added to Watchlist'));
  });
}
