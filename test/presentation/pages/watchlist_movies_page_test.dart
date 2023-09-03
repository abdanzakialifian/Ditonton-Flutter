import 'package:bloc_test/bloc_test.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:presentation/pages/watchlist_movie_page.dart';

class MockWatchlistBloc
    extends MockBloc<WatchlistEvent, WatchlistContainerState>
    implements WatchlistBloc {}

void main() {
  late WatchlistBloc watchlistBloc;

  setUp(() {
    watchlistBloc = MockWatchlistBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: watchlistBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  final dummyWatchlistMovies = [
    const Watchlist(
      id: 1,
      title: 'title',
      posterPath: 'posterPath',
      overview: 'overview',
      category: "Movies",
    )
  ];

  group('Watchlist Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => watchlistBloc.state,
      ).thenReturn(WatchlistContainerState.initialState());

      whenListen(
        watchlistBloc,
        Stream.fromIterable(
          [
            WatchlistContainerState.initialState().copyWith(
              watchlistState: WatchlistLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const WatchlistMoviePage(),
        ),
      );

      await tester.pump();

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsWidgets);
      expect(progressBarFinder, findsWidgets);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(
        () => watchlistBloc.state,
      ).thenReturn(WatchlistContainerState.initialState());

      whenListen(
        watchlistBloc,
        Stream.fromIterable(
          [
            WatchlistContainerState.initialState().copyWith(
              watchlistState: WatchlistData(dummyWatchlistMovies),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const WatchlistMoviePage(),
        ),
      );

      await tester.pump();

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(
        () => watchlistBloc.state,
      ).thenReturn(WatchlistContainerState.initialState());

      whenListen(
        watchlistBloc,
        Stream.fromIterable(
          [
            WatchlistContainerState.initialState().copyWith(
              watchlistState: WatchlistError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const WatchlistMoviePage(),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page should display image of empty when watchlist Empty',
        (WidgetTester tester) async {
      when(
        () => watchlistBloc.state,
      ).thenReturn(WatchlistContainerState.initialState());

      whenListen(
        watchlistBloc,
        Stream.fromIterable(
          [
            WatchlistContainerState.initialState().copyWith(
              watchlistState: WatchlistEmpty(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const WatchlistMoviePage(),
        ),
      );

      await tester.pump();

      final imageFinder = find.byKey(const Key('image_empty'));

      expect(imageFinder, findsOneWidget);
    });
  });
}
