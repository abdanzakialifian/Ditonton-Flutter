import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/presentation/provider/detail_notifier.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';
import 'detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetTvShowDetail,
  GetTvShowRecommendations,
])
void main() {
  late DetailNotifier detailNotifier;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetTvShowDetail mockGetTvShowDetail;
  late MockGetTvShowRecommendations mockGetTvShowRecommendations;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetTvShowDetail = MockGetTvShowDetail();
    mockGetTvShowRecommendations = MockGetTvShowRecommendations();
    detailNotifier = DetailNotifier(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getTvShowDetail: mockGetTvShowDetail,
      getTvShowRecommendations: mockGetTvShowRecommendations,
    );
  });

  final dummyMovieId = 1;

  // detail model
  final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_detail_response.json'),
    ),
  );
  final dummyDetail = dummyMovieDetailResponse.toDetail();

  // recommendation model
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;
  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  void _arrangeUsecaseMovies() {
    when(mockGetMovieDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetMovieRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategories ?? []));
  }

  void _arrangeUsecaseTvShow() {
    when(mockGetTvShowDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetTvShowRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategories ?? []));
  }

  group('Get Movie Detail', () {
    test(
        'should call get movie detail and get movie recommendations method from the usecase',
        () async {
      // arrange
      _arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      verify(mockGetMovieDetail.execute(dummyMovieId));
      verify(mockGetMovieRecommendations.execute(dummyMovieId));
    });

    test('should change state to loading when get movie detail is called', () {
      // arrange
      _arrangeUsecaseMovies();
      // act
      detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      verify(mockGetMovieDetail.execute(dummyMovieId));
      expect(detailNotifier.detailState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data when get movie detail is gotten successfully',
        () async {
      // arrange
      _arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.Loaded);
      expect(detailNotifier.detail, dummyDetail);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.Error);
      expect(detailNotifier.message, 'Server Failure');
    });
  });

  group('Get Tv Show Detail', () {
    test(
        'should call get tv show detail and get tv show recommendations method from the usecase',
        () async {
      // arrange
      _arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      verify(mockGetTvShowDetail.execute(dummyMovieId));
      verify(mockGetTvShowRecommendations.execute(dummyMovieId));
    });

    test('should change state to loading when get tv show detail is called',
        () {
      // arrange
      _arrangeUsecaseTvShow();
      // act
      detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      verify(mockGetTvShowDetail.execute(dummyMovieId));
      expect(detailNotifier.detailState, RequestState.Loading);
    });

    test(
        'should change state to loaded and get data when get tv show detail is gotten successfully',
        () async {
      // arrange
      _arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.Loaded);
      expect(detailNotifier.detail, dummyDetail);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvShowDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvShowRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyCategories ?? []));
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.Error);
      expect(detailNotifier.message, 'Server Failure');
    });
  });

  group('Get Movie Recommendations', () {
    test(
        'should call get movie detail and get movie recommendations method from the usecase',
        () async {
      // arrange
      _arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      verify(mockGetMovieDetail.execute(dummyMovieId));
      verify(mockGetMovieRecommendations.execute(dummyMovieId));
    });

    test(
        'should change state to loaded and get data when movie recommendations is gotten successfully',
        () async {
      // arrange
      _arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.Loaded);
      expect(detailNotifier.recommendations, dummyCategories ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.Error);
      expect(detailNotifier.message, 'Failed');
    });
  });

  group('Get Tv Show Recommendations', () {
    test(
        'should call get tv show detail and get tv show recommendations method from the usecase',
        () async {
      // arrange
      _arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      verify(mockGetTvShowDetail.execute(dummyMovieId));
      verify(mockGetTvShowRecommendations.execute(dummyMovieId));
    });

    test(
        'should change state to loaded and get data when tv show recommendations is gotten successfully',
        () async {
      // arrange
      _arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.Loaded);
      expect(detailNotifier.recommendations, dummyCategories ?? []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvShowDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetTvShowRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.Error);
      expect(detailNotifier.message, 'Failed');
    });
  });
}
