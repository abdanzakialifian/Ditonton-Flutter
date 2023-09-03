import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:presentation/pages/tv_shows_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockTvShowBloc extends MockBloc<TvShowEvent, TvShowContainerState>
    implements TvShowBloc {}

void main() {
  late TvShowBloc tvShowBloc;

  setUp(() {
    tvShowBloc = MockTvShowBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: tvShowBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Airing Today Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              airingTodayTvShowsState: AiringTodayTvShowsLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
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
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              airingTodayTvShowsState:
                  AiringTodayTvShowsData(dummyCategoryTvShows ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              airingTodayTvShowsState: AiringTodayTvShowsError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              popularTvShowsState: PopularTvShowsLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
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
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              popularTvShowsState:
                  PopularTvShowsData(dummyCategoryTvShows ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              popularTvShowsState: PopularTvShowsError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Top Rated Tv Shows', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              topRatedTvShowsState: TopRatedTvShowsLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
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
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              topRatedTvShowsState:
                  TopRatedTvShowsData(dummyCategoryTvShows ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final listViewFinder = find.byType(ListView);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(
        () => tvShowBloc.state,
      ).thenReturn(TvShowContainerState.initialState());

      whenListen(
        tvShowBloc,
        Stream.fromIterable(
          [
            TvShowContainerState.initialState().copyWith(
              topRatedTvShowsState: TopRatedTvShowsError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const TvShowsPage(
            type: tvShows,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });
}
