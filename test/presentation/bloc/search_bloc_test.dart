import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/search_movies.dart';
import 'package:domain/usecases/search_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/search_bloc/search_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvShows])
void main() {
  late SearchBloc searchBloc;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvShows mockSearchTvShows;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    mockSearchTvShows = MockSearchTvShows();
    searchBloc = SearchBloc(mockSearchMovies, mockSearchTvShows);
  });

  test("initial state shoud be empty", () {
    expect(searchBloc.state, SearchEmpty());
  });

  const dummyQueryMovie = 'Title';

  const dummyQueryTvShow = "Here it all begins";

  group('Search Movies', () {
    blocTest<SearchBloc, SearchState>(
      'Should emit [Loading, HasData] when data movies is gotten successfully',
      build: () {
        when(mockSearchMovies.execute(dummyQueryMovie)).thenAnswer(
          (_) async => Right(dummyCategoryMovies ?? []),
        );
        return searchBloc;
      },
      act: (bloc) => bloc.add(
        OnQueryChangedFetchMovies(dummyQueryMovie),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchData(dummyCategoryMovies ?? []),
      ],
      verify: (bloc) {
        verify(
          mockSearchMovies.execute(dummyQueryMovie),
        );
      },
    );

    blocTest<SearchBloc, SearchState>(
      'Should emit [Loading, Error] when get search movies is unsuccessful',
      build: () {
        when(mockSearchMovies.execute(dummyQueryMovie)).thenAnswer(
          (_) async => const Left(
            ServerFailure('Server Failure'),
          ),
        );
        return searchBloc;
      },
      act: (bloc) => bloc.add(
        OnQueryChangedFetchMovies(dummyQueryMovie),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(
          mockSearchMovies.execute(dummyQueryMovie),
        );
      },
    );
  });

  group('Search Tv Shows', () {
    blocTest<SearchBloc, SearchState>(
      'Should emit [Loading, HasData] when data tv shows is gotten successfully',
      build: () {
        when(mockSearchTvShows.execute(dummyQueryTvShow)).thenAnswer(
          (_) async => Right(dummyCategoryTvShows ?? []),
        );
        return searchBloc;
      },
      act: (bloc) => bloc.add(
        OnQueryChangedFetchTvShows(dummyQueryTvShow),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchData(dummyCategoryTvShows ?? []),
      ],
      verify: (bloc) {
        verify(
          mockSearchTvShows.execute(dummyQueryTvShow),
        );
      },
    );

    blocTest<SearchBloc, SearchState>(
      'Should emit [Loading, Error] when get search tv shows is unsuccessful',
      build: () {
        when(mockSearchTvShows.execute(dummyQueryTvShow)).thenAnswer(
          (_) async => const Left(
            ServerFailure('Server Failure'),
          ),
        );
        return searchBloc;
      },
      act: (bloc) => bloc.add(
        OnQueryChangedFetchTvShows(dummyQueryTvShow),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(
          mockSearchTvShows.execute(dummyQueryTvShow),
        );
      },
    );
  });
}
