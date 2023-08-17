import 'dart:convert';
import 'dart:io';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late TvShowRepositoryImpl tvShowRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    tvShowRepositoryImpl = TvShowRepositoryImpl(mockRemoteDataSource);
  });

  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;

  final dummyCategories =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  group('Get Airing Today Tv Shows', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayTvShows())
          .thenAnswer((_) async => dummyTvShowResponse ?? []);
      // act
      final result = await tvShowRepositoryImpl.getAiringTodayTvShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayTvShows());
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayTvShows())
          .thenThrow(ServerException());
      // act
      final result = await tvShowRepositoryImpl.getAiringTodayTvShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayTvShows());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getAiringTodayTvShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvShowRepositoryImpl.getAiringTodayTvShows();
      // assert
      verify(mockRemoteDataSource.getAiringTodayTvShows());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Popular Tv Shows', () {
    test('should return tv show list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => dummyTvShowResponse ?? []);
      // act
      final result = await tvShowRepositoryImpl.getPopularTvShows();
      // assert
      verify(mockRemoteDataSource.getPopularTvShows());
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvShows())
          .thenThrow(ServerException());
      // act
      final result = await tvShowRepositoryImpl.getPopularTvShows();
      // assert
      verify(mockRemoteDataSource.getPopularTvShows());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvShowRepositoryImpl.getPopularTvShows();
      // assert
      verify(mockRemoteDataSource.getPopularTvShows());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Top Rated Tv Shows', () {
    test('should return tv show list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvShows())
          .thenAnswer((_) async => dummyTvShowResponse ?? []);
      // act
      final result = await tvShowRepositoryImpl.getTopRatedTvShows();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvShows());
      expect(result, isRightThat(dummyCategories));
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvShows())
          .thenThrow(ServerException());
      // act
      final result = await tvShowRepositoryImpl.getTopRatedTvShows();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvShows());
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvShows())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvShowRepositoryImpl.getTopRatedTvShows();
      // assert
      verify(mockRemoteDataSource.getTopRatedTvShows());
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Show Detail', () {
    final dummyTvShowId = 112470;
    final dummyTvShowDetailResponse = TvShowDetailResponse.fromJson(
      jsonDecode(
        readJson('dummy_data/dummy_tv_show_detail_response.json'),
      ),
    );
    final dummyDetail = dummyTvShowDetailResponse.toEntity();

    test(
        'should return tv show data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowDetail(dummyTvShowId))
          .thenAnswer((_) async => dummyTvShowDetailResponse);
      // act
      final result = await tvShowRepositoryImpl.getTvShowDetail(dummyTvShowId);
      // assert
      verify(mockRemoteDataSource.getTvShowDetail(dummyTvShowId));
      expect(result, isRightThat(dummyDetail));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowDetail(dummyTvShowId))
          .thenThrow(ServerException());
      // act
      final result = await tvShowRepositoryImpl.getTvShowDetail(dummyTvShowId);
      // assert
      verify(mockRemoteDataSource.getTvShowDetail(dummyTvShowId));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowDetail(dummyTvShowId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvShowRepositoryImpl.getTvShowDetail(dummyTvShowId);
      // assert
      verify(mockRemoteDataSource.getTvShowDetail(dummyTvShowId));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Show Recommendations', () {
    final dummyTvShowId = 112470;

    test('should return data (tv show list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId))
          .thenAnswer((_) async => dummyTvShowResponse ?? []);
      // act
      final result =
          await tvShowRepositoryImpl.getTvShowRecommendations(dummyTvShowId);
      // assert
      verify(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId));
      expect(result, isRightThat(dummyCategories));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId))
          .thenThrow(ServerException());
      // act
      final result =
          await tvShowRepositoryImpl.getTvShowRecommendations(dummyTvShowId);
      // assertbuild runner
      verify(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result =
          await tvShowRepositoryImpl.getTvShowRecommendations(dummyTvShowId);
      // assert
      verify(mockRemoteDataSource.getTvShowRecommendations(dummyTvShowId));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Seach Tv Shows', () {
    final dummyQuery = 'Title';

    test('should return tv show list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvShows(dummyQuery))
          .thenAnswer((_) async => dummyTvShowResponse ?? []);
      // act
      final result = await tvShowRepositoryImpl.searchTvShows(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchTvShows(dummyQuery));
      expect(result, isRightThat(dummyCategories));
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvShows(dummyQuery))
          .thenThrow(ServerException());
      // act
      final result = await tvShowRepositoryImpl.searchTvShows(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchTvShows(dummyQuery));
      expect(result, isLeftThat(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvShows(dummyQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvShowRepositoryImpl.searchTvShows(dummyQuery);
      // assert
      verify(mockRemoteDataSource.searchTvShows(dummyQuery));
      expect(result,
          isLeftThat(ConnectionFailure('Failed to connect to the network')));
    });
  });
}
