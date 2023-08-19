import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
import 'search_notifier_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvShows])
void main() {
  late SearchNotifier searchNotifier;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvShows mockSearchTvShows;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    mockSearchTvShows = MockSearchTvShows();
    searchNotifier = SearchNotifier(
      searchMovies: mockSearchMovies,
      searchTvShows: mockSearchTvShows,
    );
  });

  // movie list model
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;
  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();
  final dummyQueryMovie = 'Title';

  // tv show list model
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;
  final dummyCategoriesTvShow =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();
  final dummyQueryTvShow = "Here it all begins";

  group('Search Movies', () {
    test('initial state should be empty', () {
      expect(searchNotifier.state, RequestState.Empty);
    });

    test('should call search movies method from the usecase', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      verify(mockSearchMovies.execute(dummyQueryMovie));
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      expect(searchNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data movies when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      expect(searchNotifier.state, RequestState.Loaded);
      expect(searchNotifier.searchResult, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      expect(searchNotifier.state, RequestState.Error);
      expect(searchNotifier.message, 'Server Failure');
    });
  });

  group('Search Tv Shows', () {
    test('initial state should be empty', () {
      expect(searchNotifier.state, RequestState.Empty);
    });

    test('should call search tv shows method from the usecase', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      verify(mockSearchTvShows.execute(dummyQueryTvShow));
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      expect(searchNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      await searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      expect(searchNotifier.state, RequestState.Loaded);
      expect(searchNotifier.searchResult, dummyCategoriesTvShow);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      expect(searchNotifier.state, RequestState.Error);
      expect(searchNotifier.message, 'Server Failure');
    });
  });

  group('Clear Search Result', () {
    test('should clear search result movies', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await searchNotifier.fetchMovieSearch(dummyQueryMovie);
      searchNotifier.clearSearchResult();
      // assert
      expect(searchNotifier.searchResult, []);
    });

    test('should clear search result tv shows', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      await searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      searchNotifier.clearSearchResult();
      // assert
      expect(searchNotifier.searchResult, []);
    });
  });
}
