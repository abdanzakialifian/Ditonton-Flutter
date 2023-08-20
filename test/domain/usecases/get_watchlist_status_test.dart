import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListStatus getWatchListStatus;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    getWatchListStatus = GetWatchListStatus(mockWatchlistRepository);
  });

  const dummyWatchlistId = 1;

  group('Get Watchlist Status', () {
    test('should get watchlist status true from repository', () async {
      // arrange
      when(mockWatchlistRepository.isAddedToWatchlist(dummyWatchlistId))
          .thenAnswer((_) async => true);
      // act
      final result = await getWatchListStatus.execute(dummyWatchlistId);
      // assert
      verify(mockWatchlistRepository.isAddedToWatchlist(dummyWatchlistId));
      expect(result, true);
    });

    test('should get watchlist status false from repository', () async {
      // arrange
      when(mockWatchlistRepository.isAddedToWatchlist(dummyWatchlistId))
          .thenAnswer((_) async => false);
      // act
      final result = await getWatchListStatus.execute(dummyWatchlistId);
      // assert
      verify(mockWatchlistRepository.isAddedToWatchlist(dummyWatchlistId));
      expect(result, false);
    });
  });
}
