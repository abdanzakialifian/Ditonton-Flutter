import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_tv_show_detail.dart';
import 'package:domain/usecases/get_tv_show_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/detail_bloc/detail_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import '../provider/detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetTvShowDetail,
  GetTvShowRecommendations,
])
void main() {
  late DetailBloc detailBloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetTvShowDetail mockGetTvShowDetail;
  late MockGetTvShowRecommendations mockGetTvShowRecommendations;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetTvShowDetail = MockGetTvShowDetail();
    mockGetTvShowRecommendations = MockGetTvShowRecommendations();
    detailBloc = DetailBloc(
      mockGetMovieDetail,
      mockGetMovieRecommendations,
      mockGetTvShowDetail,
      mockGetTvShowRecommendations,
    );
  });

  const dummyMovieId = 1;
  const dummyTvShowId = 1;

  // detail model
  final dummyDetail = dummyMovieDetailResponse.toDetail();

  void arrangeUsecaseDetailMovie() {
    when(mockGetMovieDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetMovieRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
  }

  void arrangeUsecaseDetailMovieWithEmptyRecommendation() {
    when(mockGetMovieDetail.execute(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetMovieRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => const Right([]));
  }

  void arrangeUsecaseDetailMovieWithError() {
    when(mockGetMovieDetail.execute(dummyMovieId))
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    when(mockGetMovieRecommendations.execute(dummyMovieId))
        .thenAnswer((_) async => const Right([]));
  }

  void arrangeUsecaseDetailTvShow() {
    when(mockGetTvShowDetail.execute(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetTvShowRecommendations.execute(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
  }

  void arrangeUsecaseDetailTvShowWithEmptyRecommendation() {
    when(mockGetTvShowDetail.execute(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyDetail));
    when(mockGetTvShowRecommendations.execute(dummyTvShowId))
        .thenAnswer((_) async => const Right([]));
  }

  void arrangeUsecaseDetailTvShowWithError() {
    when(mockGetTvShowDetail.execute(dummyTvShowId))
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    when(mockGetTvShowRecommendations.execute(dummyTvShowId))
        .thenAnswer((_) async => const Right([]));
  }

  test("initial state shoud be empty", () {
    expect(
      detailBloc.state,
      DetailContainerState.initialState(),
    );
  });

  group(
    'Get Movie Detail',
    () {
      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, HasData] when data detail and recommendations movie is gotten successfully',
        build: () {
          arrangeUsecaseDetailMovie();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchMovieDetail(dummyMovieId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationLoading(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationData(dummyCategoryMovies ?? []),
          ),
          DetailContainerState(
            detailState: DetailData(dummyDetail),
            recommendationState: RecommendationData(dummyCategoryMovies ?? []),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetMovieDetail.execute(dummyMovieId),
          );
          verify(
            mockGetMovieRecommendations.execute(dummyMovieId),
          );
        },
      );

      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, HasData] when data detail and recommendations movie is gotten successfully but recommendations is empty',
        build: () {
          arrangeUsecaseDetailMovieWithEmptyRecommendation();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchMovieDetail(dummyMovieId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationLoading(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailData(dummyDetail),
            recommendationState: RecommendationEmpty(),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetMovieDetail.execute(dummyMovieId),
          );
          verify(
            mockGetMovieRecommendations.execute(dummyMovieId),
          );
        },
      );

      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, Error] when get detail movie is unsuccessful',
        build: () {
          arrangeUsecaseDetailMovieWithError();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchMovieDetail(dummyMovieId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailError('Server Failure'),
            recommendationState: RecommendationEmpty(),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetMovieDetail.execute(dummyMovieId),
          );
          verify(
            mockGetMovieRecommendations.execute(dummyMovieId),
          );
        },
      );

      tearDown(() => detailBloc.close());
    },
  );

  group(
    'Get Tv Show Detail',
    () {
      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, HasData] when data detail and recommendations tv show is gotten successfully',
        build: () {
          arrangeUsecaseDetailTvShow();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchTvShowDetail(dummyTvShowId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationLoading(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationData(dummyCategoryTvShows ?? []),
          ),
          DetailContainerState(
            detailState: DetailData(dummyDetail),
            recommendationState: RecommendationData(dummyCategoryTvShows ?? []),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetTvShowDetail.execute(dummyTvShowId),
          );
          verify(
            mockGetTvShowRecommendations.execute(dummyTvShowId),
          );
        },
      );

      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, HasData] when data detail and recommendations tv show is gotten successfully but recommendations is empty',
        build: () {
          arrangeUsecaseDetailTvShowWithEmptyRecommendation();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchTvShowDetail(dummyTvShowId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationLoading(),
          ),
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailData(dummyDetail),
            recommendationState: RecommendationEmpty(),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetTvShowDetail.execute(dummyTvShowId),
          );
          verify(
            mockGetTvShowRecommendations.execute(dummyTvShowId),
          );
        },
      );

      blocTest<DetailBloc, DetailContainerState>(
        'Should emit [Loading, Error] when get detail tv show is unsuccessful',
        build: () {
          arrangeUsecaseDetailTvShowWithError();
          return detailBloc;
        },
        act: (bloc) => bloc.add(
          FetchTvShowDetail(dummyTvShowId),
        ),
        expect: () => [
          DetailContainerState(
            detailState: DetailLoading(),
            recommendationState: RecommendationEmpty(),
          ),
          DetailContainerState(
            detailState: DetailError('Server Failure'),
            recommendationState: RecommendationEmpty(),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetTvShowDetail.execute(dummyTvShowId),
          );
          verify(
            mockGetTvShowRecommendations.execute(dummyTvShowId),
          );
        },
      );

      tearDown(() => detailBloc.close());
    },
  );
}
