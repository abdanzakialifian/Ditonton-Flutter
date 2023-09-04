import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/now_playing_bloc/now_playing_bloc.dart';
import 'package:presentation/pages/now_playing_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockNowPlayingBloc extends MockBloc<NowPlayingEvent, NowPlayingState>
    implements NowPlayingBloc {}

void main() {
  late NowPlayingBloc nowPlayingBloc;

  setUp(() {
    nowPlayingBloc = MockNowPlayingBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: nowPlayingBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Now Playing Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => nowPlayingBloc.state,
      ).thenReturn(NowPlayingLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
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
      when(() => nowPlayingBloc.state)
          .thenReturn(NowPlayingData(dummyCategoryMovies ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
            type: movies,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => nowPlayingBloc.state)
          .thenReturn(NowPlayingError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
            type: movies,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Now Playing Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => nowPlayingBloc.state).thenReturn(NowPlayingLoading());

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
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
      when(() => nowPlayingBloc.state)
          .thenReturn(NowPlayingData(dummyCategoryTvShows ?? []));

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
            type: tvShows,
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => nowPlayingBloc.state)
          .thenReturn(NowPlayingError('Error message'));

      await tester.pumpWidget(
        makeTestableWidget(
          const NowPlayingPage(
            type: tvShows,
          ),
        ),
      );

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });
}
