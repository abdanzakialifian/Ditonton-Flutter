import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:core/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAiringTodayTvShows getAiringTodayTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getAiringTodayTvShows = GetAiringTodayTvShows(mockTvShowRepository);
  });

  test('should get list of tv shows from the repository', () async {
    // arrange
    when(mockTvShowRepository.getAiringTodayTvShows())
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
    // act
    final result = await getAiringTodayTvShows.execute();
    // assert
    verify(mockTvShowRepository.getAiringTodayTvShows());
    expect(result, isRightThat(dummyCategoryTvShows));
  });
}
