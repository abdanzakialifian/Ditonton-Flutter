import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTvShows getTopRatedTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTopRatedTvShows = GetTopRatedTvShows(mockTvShowRepository);
  });

  test('should get list of tv shows from repository', () async {
    // arrange
    when(mockTvShowRepository.getTopRatedTvShows())
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
    // act
    final result = await getTopRatedTvShows.execute();
    // assert
    verify(mockTvShowRepository.getTopRatedTvShows());
    expect(result, isRightThat(dummyCategoryTvShows));
  });
}
