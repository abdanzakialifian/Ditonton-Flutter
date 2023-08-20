import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/detail_page.dart';
import 'package:ditonton/presentation/provider/detail_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../dummy_data/dummy_objects.dart';
import 'detail_page_test.mocks.dart';

@GenerateMocks([DetailNotifier, WatchlistNotifier])
void main() {
  late MockDetailNotifier mockDetailNotifier;
  late MockWatchlistNotifier mockWatchlistNotifier;

  setUp(() {
    mockDetailNotifier = MockDetailNotifier();
    mockWatchlistNotifier = MockWatchlistNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<DetailNotifier>.value(
      value: mockDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Detail Movie', () {
    testWidgets(
        'Watchlist button should display add icon when movie not added to watchlist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryMovies ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButtonIcon = find.byIcon(Icons.add);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: movies,
          ),
        ),
      );

      expect(watchlistButtonIcon, findsOneWidget);
    });

    testWidgets(
        'Watchlist button should dispay check icon when movie is added to wathclist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryMovies ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(true);
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButtonIcon = find.byIcon(Icons.check);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: movies,
          ),
        ),
      );

      expect(watchlistButtonIcon, findsOneWidget);
    });

    testWidgets(
        'Watchlist button should display Snackbar when added to watchlist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryMovies ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.watchlistMessage)
          .thenReturn('Added to Watchlist');
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(makeTestableWidget(const DetailPage(
        id: 1,
        type: movies,
      )));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });

    testWidgets(
        'Watchlist button should display AlertDialog when add to watchlist failed',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryMovies ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.watchlistMessage).thenReturn('Failed');
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: movies,
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
    });
  });

  group('Detail Tv Show', () {
    testWidgets(
        'Watchlist button should display add icon when movie not added to watchlist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryTvShows ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButtonIcon = find.byIcon(Icons.add);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: tvShows,
          ),
        ),
      );

      expect(watchlistButtonIcon, findsOneWidget);
    });

    testWidgets(
        'Watchlist button should dispay check icon when movie is added to wathclist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryTvShows ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(true);
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButtonIcon = find.byIcon(Icons.check);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: tvShows,
          ),
        ),
      );

      expect(watchlistButtonIcon, findsOneWidget);
    });

    testWidgets(
        'Watchlist button should display Snackbar when added to watchlist',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryTvShows ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.watchlistMessage)
          .thenReturn('Added to Watchlist');
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(makeTestableWidget(const DetailPage(
        id: 1,
        type: tvShows,
      )));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });

    testWidgets(
        'Watchlist button should display AlertDialog when add to watchlist failed',
        (WidgetTester tester) async {
      when(mockDetailNotifier.detailState).thenReturn(RequestState.loaded);
      when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
      when(mockDetailNotifier.recommendationState)
          .thenReturn(RequestState.loaded);
      when(mockDetailNotifier.recommendations)
          .thenReturn(dummyCategoryTvShows ?? []);
      when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
      when(mockWatchlistNotifier.watchlistMessage).thenReturn('Failed');
      when(mockWatchlistNotifier.loadWatchlistStatus(dummyCategory.id));

      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(
        makeTestableWidget(
          const DetailPage(
            id: 1,
            type: tvShows,
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
    });
  });
}
