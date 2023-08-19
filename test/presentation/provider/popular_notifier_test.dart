import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/presentation/provider/popular_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../json_reader.dart';
import 'popular_notifier_test.mocks.dart';

@GenerateMocks([GetPopularMovies, GetPopularTvShows])
void main() {
  late PopularNotifier popularNotifier;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetPopularTvShows mockGetPopularTvShows;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetPopularTvShows = MockGetPopularTvShows();
    popularNotifier =
        PopularNotifier(mockGetPopularMovies, mockGetPopularTvShows);
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

  group('Get Popular Movies', () {
    test('initial state should be empty', () {
      expect(popularNotifier.state, RequestState.Empty);
    });

    test('should call get popular movies method from the usecase', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      popularNotifier.fetchPopularMovies();
      // assert
      verify(mockGetPopularMovies.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data popular movies when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.Loaded);
      expect(popularNotifier.data, dummyCategories ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await popularNotifier.fetchPopularMovies();
      // assert
      expect(popularNotifier.state, RequestState.Error);
      expect(popularNotifier.message, 'Server Failure');
    });
  });

  group('Get Popular Tv Shows', () {
    test('initial state should be empty', () {
      expect(popularNotifier.state, RequestState.Empty);
    });

    test('should call get popular tv shows method from the usecase', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      popularNotifier.fetchPopularTvShows();
      // assert
      verify(mockGetPopularTvShows.execute());
    });

    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data popular tv shows when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Right(dummyCategoriesTvShow ?? []));
      // act
      await popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.Loaded);
      expect(popularNotifier.data, dummyCategoriesTvShow ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvShows.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await popularNotifier.fetchPopularTvShows();
      // assert
      expect(popularNotifier.state, RequestState.Error);
      expect(popularNotifier.message, 'Server Failure');
    });
  });
}
