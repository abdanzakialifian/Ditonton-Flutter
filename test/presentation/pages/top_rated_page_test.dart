import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:presentation/pages/top_rated_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockTopRatedBloc extends MockBloc<TopRatedEvent, TopRatedState>
    implements TopRatedBloc {}

void main() {
  late TopRatedBloc topRatedBloc;

  setUp(() {
    topRatedBloc = MockTopRatedBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: topRatedBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Top Rated Movies', () {
    testWidgets('Page should display progress bar when loading',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state).thenReturn(TopRatedLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: movies,
          ),
        ),
      );

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    });

    testWidgets('Page should display when data is loaded',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state)
          .thenReturn(TopRatedData(dummyCategoryMovies ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: movies,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state).thenReturn(TopRatedError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: movies,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Top Rated Tv Shows', () {
    testWidgets('Page should display progress bar when loading',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state).thenReturn(TopRatedLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: tvShows,
          ),
        ),
      );

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    });

    testWidgets('Page should display when data is loaded',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state)
          .thenReturn(TopRatedData(dummyCategoryTvShows ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: tvShows,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => topRatedBloc.state).thenReturn(TopRatedError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const TopRatedPage(
            type: tvShows,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });
}
