import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:core/domain/usecases/get_tv_show_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowRecommendations getTvShowRecommendations;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTvShowRecommendations = GetTvShowRecommendations(mockTvShowRepository);
  });

  const dummyTvShowId = 90521;

  test('should get list of tv shows recommendations from the repository',
      () async {
    // arrange
    when(mockTvShowRepository.getTvShowRecommendations(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
    // act
    final result = await getTvShowRecommendations.execute(dummyTvShowId);
    // assert
    verify(mockTvShowRepository.getTvShowRecommendations(dummyTvShowId));
    expect(result, isRightThat(dummyCategoryTvShows));
  });
}
