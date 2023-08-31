import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/pages/popular_page.dart';
import 'package:presentation/provider/popular_notifier.dart';
import 'package:provider/provider.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_page_test.mocks.dart';

@GenerateMocks([PopularNotifier])
void main() {
  late MockPopularNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockPopularNotifier();
  });

  Widget makeTestableWidget(Widget body) {
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
      when(mockNotifier.state).thenReturn(RequestState.loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryMovies ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.error);
      when(mockNotifier.message).thenReturn('Error message');

      final textFinder = find.byKey(const Key('error_message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryTvShows ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: tvShows,
          ),
        ),
      );

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.error);
      when(mockNotifier.message).thenReturn('Error message');

      final textFinder = find.byKey(const Key('error_message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: tvShows,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });
}
