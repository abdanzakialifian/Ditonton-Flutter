import 'dart:io';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockRemoteDataSource);
  });

  group('Get Now Playing Movies', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingMovies())
          .thenAnswer((_) async => dummyMovieResponse.movieList ?? []);
      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies();
      // assert
      verify(mockRemoteDataSource.getNowPlayingMovies());
      expect(result, isRightThat(dummyCategoryMovies));
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingMovies())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies();
      // assert
      verify(mockRemoteDataSource.getNowPlayingMovies());
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Movie Detail', () {
    const dummyMovieId = 1;
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieDetail(dummyMovieId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getMovieDetail(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieDetail(dummyMovieId));
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Movie Recommendations', () {
    const dummyMovieId = 1;

    test('should return data (movie list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieRecommendations(dummyMovieId))
          .thenAnswer((_) async => dummyMovieResponse.movieList ?? []);
      // act
      final result =
          await movieRepositoryImpl.getMovieRecommendations(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieRecommendations(dummyMovieId));
      expect(result, isRightThat(dummyCategoryMovies));
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getMovieRecommendations(dummyMovieId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result =
          await movieRepositoryImpl.getMovieRecommendations(dummyMovieId);
      // assert
      verify(mockRemoteDataSource.getMovieRecommendations(dummyMovieId));
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Popular Movies', () {
    test('should return movie list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies())
          .thenAnswer((_) async => dummyMovieResponse.movieList ?? []);
      // act
      final result = await movieRepositoryImpl.getPopularMovies();
      // assert
      verify(mockRemoteDataSource.getPopularMovies());
      expect(result, isRightThat(dummyCategoryMovies));
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularMovies())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getPopularMovies();
      // assert
      verify(mockRemoteDataSource.getPopularMovies());
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Top Rated Movies', () {
    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedMovies())
          .thenAnswer((_) async => dummyMovieResponse.movieList ?? []);
      // act
      final result = await movieRepositoryImpl.getTopRatedMovies();
      // assert
      verify(mockRemoteDataSource.getTopRatedMovies());
      expect(result, isRightThat(dummyCategoryMovies));
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedMovies())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.getTopRatedMovies();
      // assert
      verify(mockRemoteDataSource.getTopRatedMovies());
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Seach Movies', () {
    const dummyQuery = 'Title';

    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(dummyQuery))
          .thenAnswer((_) async => dummyMovieResponse.movieList ?? []);
      // act
      final result = await movieRepositoryImpl.searchMovies(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchMovies(dummyQuery));
      expect(result, isRightThat(dummyCategoryMovies));
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
      expect(result, isLeftThat(const ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchMovies(dummyQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await movieRepositoryImpl.searchMovies(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchMovies(dummyQuery));
      expect(
          result,
          isLeftThat(
              const ConnectionFailure('Failed to connect to the network')));
    });
  });
}
