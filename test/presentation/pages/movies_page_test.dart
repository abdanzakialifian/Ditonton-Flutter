import 'package:bloc_test/bloc_test.dart';
import 'package:core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:presentation/pages/movies_page.dart';
import '../../dummy_data/dummy_objects.dart';

class MockMovieBloc extends MockBloc<MovieEvent, MovieContainerState>
    implements MovieBloc {}

void main() {
  late MovieBloc movieBloc;

  setUp(() {
    movieBloc = MockMovieBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider.value(
      value: movieBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Now Playing Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              nowPlayingMoviesState: NowPlayingMoviesLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              nowPlayingMoviesState:
                  NowPlayingMoviesData(dummyCategoryMovies ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              nowPlayingMoviesState: NowPlayingMoviesError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              popularMoviesState: PopularMoviesLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              popularMoviesState: PopularMoviesData(dummyCategoryMovies ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              popularMoviesState: PopularMoviesError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Top Rated Movies', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              topRatedMoviesState: TopRatedMoviesLoading(),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              topRatedMoviesState:
                  TopRatedMoviesData(dummyCategoryMovies ?? []),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
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
        () => movieBloc.state,
      ).thenReturn(MovieContainerState.initialState());

      whenListen(
        movieBloc,
        Stream.fromIterable(
          [
            MovieContainerState.initialState().copyWith(
              topRatedMoviesState: TopRatedMoviesError('Error message'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          const MoviesPage(
            type: movies,
          ),
        ),
      );

      await tester.pump();

      final textFinder = find.byKey(const Key('error_message'));

      expect(textFinder, findsOneWidget);
    });
  });
}
