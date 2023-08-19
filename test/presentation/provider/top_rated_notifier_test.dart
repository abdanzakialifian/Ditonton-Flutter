import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
import 'top_rated_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies, GetTopRatedTvShows])
void main() {
  late TopRatedNotifier topRatedNotifier;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetTopRatedTvShows mockGetTopRatedTvShows;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetTopRatedTvShows = MockGetTopRatedTvShows();
    topRatedNotifier =
        TopRatedNotifier(mockGetTopRatedMovies, mockGetTopRatedTvShows);
  });

  // movie list model
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;
  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  // tv show list model
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;
  final dummyCategoriesTvShow =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  group('Get Top Rated Movies', () {
    test('initial state should be empty', () {
      expect(topRatedNotifier.state, RequestState.Empty);
    });

    test('should call get top rated movies method from the usecase', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      topRatedNotifier.fetchTopRatedMovies();
      // assert
      verify(mockGetTopRatedMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Loaded);
      expect(topRatedNotifier.data, dummyCategories);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await topRatedNotifier.fetchTopRatedMovies();
      // assert
      expect(topRatedNotifier.state, RequestState.Error);
      expect(topRatedNotifier.message, 'Server Failure');
    });
  });

  group('Get Top Rated Tv Shows', () {
    test('initial state should be empty', () {
      expect(topRatedNotifier.state, RequestState.Empty);
    });

    test('should call get top rated tv shows method from the usecase',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      topRatedNotifier.fetchTopRatedTvShows();
      // assert
      verify(mockGetTopRatedTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data top rated tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      await topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Loaded);
      expect(topRatedNotifier.data, dummyCategoriesTvShow);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await topRatedNotifier.fetchTopRatedTvShows();
      // assert
      expect(topRatedNotifier.state, RequestState.Error);
      expect(topRatedNotifier.message, 'Server Failure');
    });
  });
}
