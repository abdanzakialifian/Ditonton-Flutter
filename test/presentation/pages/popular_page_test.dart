import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:presentation/pages/popular_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockPopularBloc extends MockBloc<PopularEvent, PopularState>
    implements PopularBloc {}

void main() {
  late PopularBloc popularBloc;

  setUp(() {
    popularBloc = MockPopularBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: popularBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Popular Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => popularBloc.state,
      ).thenReturn(PopularLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => popularBloc.state)
          .thenReturn(PopularData(dummyCategoryMovies ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => popularBloc.state).thenReturn(PopularError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: movies,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => popularBloc.state).thenReturn(PopularLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: tvShows,
          ),
        ),
      );

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => popularBloc.state)
          .thenReturn(PopularData(dummyCategoryTvShows ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: tvShows,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => popularBloc.state).thenReturn(PopularError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const PopularPage(
            type: tvShows,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });
}
