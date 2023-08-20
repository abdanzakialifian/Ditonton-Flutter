import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/top_rated_page.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_page_test.mocks.dart';

@GenerateMocks([TopRatedNotifier])
void main() {
  late MockTopRatedNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTopRatedNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TopRatedNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Top Rated Movies', () {
    testWidgets('Page should display progress bar when loading',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loading);

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: movies,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    });

    testWidgets('Page should display when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryMovies ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
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
          const TopRatedPage(
            type: movies,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });

  group('Top Rated Tv Shows', () {
    testWidgets('Page should display progress bar when loading',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loading);

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: tvShows,
          ),
        ),
      );

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    });

    testWidgets('Page should display when data is loaded',
        (WidgetTester tester) async {
      when(mockNotifier.state).thenReturn(RequestState.loaded);
      when(mockNotifier.data).thenReturn(dummyCategoryTvShows ?? []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
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
          const TopRatedPage(
            type: tvShows,
          ),
        ),
      );

      expect(textFinder, findsOneWidget);
    });
  });
}
