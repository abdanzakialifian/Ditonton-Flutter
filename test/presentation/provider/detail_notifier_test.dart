import 'package:dartz/dartz.dart';
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

  const dummyMovieId = 1;

  // detail model
  final dummyDetail = dummyMovieDetailResponse.toDetail();

  void arrangeUsecaseMovies() {
    when(mockGetMovieDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetMovieRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
  }

  void arrangeUsecaseTvShow() {
    when(mockGetTvShowDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetTvShowRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
  }

  group('Get Movie Detail', () {
    test(
        'should call get movie detail and get movie recommendations method from the usecase',
        () async {
      // arrange
      arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      verify(mockGetMovieDetail.execute(dummyMovieId));
      verify(mockGetMovieRecommendations.execute(dummyMovieId));
    });

    test('should change state to loading when get movie detail is called', () {
      // arrange
      arrangeUsecaseMovies();
      // act
      detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      verify(mockGetMovieDetail.execute(dummyMovieId));
      expect(detailNotifier.detailState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data when get movie detail is gotten successfully',
        () async {
      // arrange
      arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.loaded);
      expect(detailNotifier.detail, dummyDetail);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(dummyMovieId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.error);
      expect(detailNotifier.message, 'Server Failure');
    });
  });

  group('Get Tv Show Detail', () {
    test(
        'should call get tv show detail and get tv show recommendations method from the usecase',
        () async {
      // arrange
      arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      verify(mockGetTvShowDetail.execute(dummyMovieId));
      verify(mockGetTvShowRecommendations.execute(dummyMovieId));
    });

    test('should change state to loading when get tv show detail is called',
        () {
      // arrange
      arrangeUsecaseTvShow();
      // act
      detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      verify(mockGetTvShowDetail.execute(dummyMovieId));
      expect(detailNotifier.detailState, RequestState.loading);
    });

    test(
        'should change state to loaded and get data when get tv show detail is gotten successfully',
        () async {
      // arrange
      arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.loaded);
      expect(detailNotifier.detail, dummyDetail);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvShowDetail.execute(dummyMovieId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetTvShowRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.detailState, RequestState.error);
      expect(detailNotifier.message, 'Server Failure');
    });
  });

  group('Get Movie Recommendations', () {
    test(
        'should call get movie detail and get movie recommendations method from the usecase',
        () async {
      // arrange
      arrangeUsecaseMovies();
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
      arrangeUsecaseMovies();
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.loaded);
      expect(detailNotifier.recommendations, dummyCategoryMovies ?? []);
    });

    test(
        'should change state to loaded and get data empty when movie recommendations is gotten successfully',
        () async {
      // arrange
      when(mockGetMovieDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyDetail));
      when(mockGetMovieRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => const Right([]));
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.empty);
      expect(detailNotifier.recommendations, []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail.execute(dummyMovieId))
          .thenAnswer((_) async => const Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await detailNotifier.fetchMovieDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.error);
      expect(detailNotifier.message, 'Failed');
    });
  });

  group('Get Tv Show Recommendations', () {
    test(
        'should call get tv show detail and get tv show recommendations method from the usecase',
        () async {
      // arrange
      arrangeUsecaseTvShow();
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
      arrangeUsecaseTvShow();
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.loaded);
      expect(detailNotifier.recommendations, dummyCategoryTvShows ?? []);
    });

    test(
        'should change state to loaded and get data empty when tv show recommendations is gotten successfully',
        () async {
      // arrange
      when(mockGetTvShowDetail.execute(dummyMovieId))
          .thenAnswer((_) async => Right(dummyDetail));
      when(mockGetTvShowRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => const Right([]));
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.empty);
      expect(detailNotifier.recommendations, []);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvShowDetail.execute(dummyMovieId))
          .thenAnswer((_) async => const Right(testMovieDetail));
      when(mockGetTvShowRecommendations.execute(dummyMovieId))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await detailNotifier.fetchTvShowDetail(dummyMovieId);
      // assert
      expect(detailNotifier.recommendationState, RequestState.error);
      expect(detailNotifier.message, 'Failed');
    });
  });
}
