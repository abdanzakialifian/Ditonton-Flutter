import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/category.dart';
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

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<DetailNotifier>.value(
      value: mockDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.recommendations).thenReturn(<Category>[]);
    when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(
      _makeTestableWidget(
        DetailPage(
          id: 1,
          type: MOVIES,
        ),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.recommendations).thenReturn(<Category>[]);
    when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(
      _makeTestableWidget(
        DetailPage(
          id: 1,
          type: MOVIES,
        ),
      ),
    );

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.recommendations).thenReturn(<Category>[]);
    when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockWatchlistNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(DetailPage(
      id: 1,
      type: MOVIES,
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
    when(mockDetailNotifier.detailState).thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.detail).thenReturn(testMovieDetail);
    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockDetailNotifier.recommendations).thenReturn(<Category>[]);
    when(mockWatchlistNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockWatchlistNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(
      _makeTestableWidget(
        DetailPage(
          id: 1,
          type: MOVIES,
        ),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
