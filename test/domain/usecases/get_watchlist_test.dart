import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlist getWatchlist;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    getWatchlist = GetWatchlist(mockWatchlistRepository);
  });

  final WatchlistTable dummyWatchlistTable = WatchlistTable(
    id: 1,
    title: "Title",
    posterPath: "Poster Path",
    overview: "Overview",
    category: "Movie or Tv Show",
  );

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  group('Get Watchlist', () {
    test('should get list not empty of watchlist from the repository',
        () async {
      // arrange
      when(mockWatchlistRepository.getWatchlist())
          .thenAnswer((_) async => Right([dummyWatchlist]));
      // act
      final result = await getWatchlist.execute();
      // assert
      verify(mockWatchlistRepository.getWatchlist());
      expect(result, isRightThat([dummyWatchlist]));
    });

    test('should get list empty of watchlist from the repository', () async {
      // arrange
      when(mockWatchlistRepository.getWatchlist())
          .thenAnswer((_) async => Right([]));
      // act
      final result = await getWatchlist.execute();
      // assert
      verify(mockWatchlistRepository.getWatchlist());
      expect(result, isRightThat([]));
    });
  });
}
