import 'dart:convert';
import 'dart:io';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockRemoteDataSource);
  });

  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;

  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  group('Get Now Playing Movies', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingMovies())
          .thenAnswer((_) async => dummyMoviesResponse ?? []);
      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies();
      // assert
      verify(mockRemoteDataSource.getNowPlayingMovies());
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingMovies())
          .thenThrow(ServerException());
      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies();
      // assert
      verify(mockRemoteDataSource.getNowPlayingMovies());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingMovies())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies();
      // assert
      verify(mockRemoteDataSource.getNowPlayingMovies());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Movie Detail', () {
    final dummyMovieId = 1;
    final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
      jsonDecode(
        readJson('dummy_data/dummy_movie_detail_response.json'),
      ),
    );
    final dummyDetail = dummyMovieDetailResponse.toDetail();

    test(
        'should return movie data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(dummyMovieId))
          .thenAnswer((_) async => dummyMovieDetailResponse);
      // act
      final result = await movieRepositoryImpl.getMovieDetail(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieDetail(dummyMovieId));
      expect(result, isRightThat(dummyDetail));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(dummyMovieId))
          .thenThrow(ServerException());
      // act
      final result = await movieRepositoryImpl.getMovieDetail(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieDetail(dummyMovieId));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(dummyMovieId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getMovieDetail(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieDetail(dummyMovieId));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Movie Recommendations', () {
    final dummyMovieId = 1;

    test('should return data (movie list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieRecommendations(dummyMovieId))
          .thenAnswer((_) async => dummyMoviesResponse ?? []);
      // act
      final result =
          await movieRepositoryImpl.getMovieRecommendations(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieRecommendations(dummyMovieId));
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieRecommendations(dummyMovieId))
          .thenThrow(ServerException());
      // act
      final result =
          await movieRepositoryImpl.getMovieRecommendations(dummyMovieId);
      // assertbuild runner
      verify(mockRemoteDataSource.getMovieRecommendations(dummyMovieId));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieRecommendations(dummyMovieId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result =
          await movieRepositoryImpl.getMovieRecommendations(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieRecommendations(dummyMovieId));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Popular Movies', () {
    test('should return movie list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies())
          .thenAnswer((_) async => dummyMoviesResponse ?? []);
      // act
      final result = await movieRepositoryImpl.getPopularMovies();
      // assert
      verify(mockRemoteDataSource.getPopularMovies());
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies())
          .thenThrow(ServerException());
      // act
      final result = await movieRepositoryImpl.getPopularMovies();
      // assert
      verify(mockRemoteDataSource.getPopularMovies());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getPopularMovies();
      // assert
      verify(mockRemoteDataSource.getPopularMovies());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Top Rated Movies', () {
    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedMovies())
          .thenAnswer((_) async => dummyMoviesResponse ?? []);
      // act
      final result = await movieRepositoryImpl.getTopRatedMovies();
      // assert
      verify(mockRemoteDataSource.getTopRatedMovies());
      expect(result, isRightThat(dummyCategories));
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedMovies())
          .thenThrow(ServerException());
      // act
      final result = await movieRepositoryImpl.getTopRatedMovies();
      // assert
      verify(mockRemoteDataSource.getTopRatedMovies());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedMovies())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getTopRatedMovies();
      // assert
      verify(mockRemoteDataSource.getTopRatedMovies());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Seach Movies', () {
    final dummyQuery = 'Title';

    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(dummyQuery))
          .thenAnswer((_) async => dummyMoviesResponse ?? []);
      // act
      final result = await movieRepositoryImpl.searchMovies(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchMovies(dummyQuery));
      expect(result, isRightThat(dummyCategories));
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(dummyQuery))
          .thenThrow(ServerException());
      // act
      final result = await movieRepositoryImpl.searchMovies(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchMovies(dummyQuery));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(dummyQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.searchMovies(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchMovies(dummyQuery));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });
}
