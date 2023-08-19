import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
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

  final dummyQueryMovie = 'Title';

  final dummyQueryTvShow = "Here it all begins";

  group('Search Movies', () {
    test('initial state should be empty', () {
      expect(searchNotifier.state, RequestState.Empty);
    });

    test('should call search movies method from the usecase', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      verify(mockSearchMovies.execute(dummyQueryMovie));
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
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
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await searchNotifier.fetchMovieSearch(dummyQueryMovie);
      // assert
      expect(searchNotifier.state, RequestState.Loaded);
      expect(searchNotifier.searchResult, dummyCategoryMovies);
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
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      verify(mockSearchTvShows.execute(dummyQueryTvShow));
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
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
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      // assert
      expect(searchNotifier.state, RequestState.Loaded);
      expect(searchNotifier.searchResult, dummyCategoryTvShows);
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
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await searchNotifier.fetchMovieSearch(dummyQueryMovie);
      searchNotifier.clearSearchResult();
      // assert
      expect(searchNotifier.searchResult, []);
    });

    test('should clear search result tv shows', () async {
      // arrange
      when(mockSearchTvShows.execute(dummyQueryTvShow))
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await searchNotifier.fetchTvShowSearch(dummyQueryTvShow);
      searchNotifier.clearSearchResult();
      // assert
      expect(searchNotifier.searchResult, []);
    });
  });
}
