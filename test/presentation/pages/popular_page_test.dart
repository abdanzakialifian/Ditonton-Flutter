import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/popular_page.dart';
import 'package:ditonton/presentation/provider/popular_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_page_test.mocks.dart';

@GenerateMocks([PopularNotifier])
void main() {
  late MockPopularNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockPopularNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<PopularNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Popular Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: MOVIES,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryMovies ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: MOVIES,
          ),
        ),
      );

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Error);
      when(mockNotifier.message).thenReturn('Error message');

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: MOVIES,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: TV_SHOWS,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryTvShows ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: TV_SHOWS,
          ),
        ),
      );

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.Error);
      when(mockNotifier.message).thenReturn('Error message');

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
        _makeTestableWidget(
          PopularPage(
            type: TV_SHOWS,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });
}
