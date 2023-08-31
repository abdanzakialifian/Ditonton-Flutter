import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../dummy_data/dummy_objects.dart';
import '../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvShows getPopularTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getPopularTvShows = GetPopularTvShows(mockTvShowRepository);
  });

  test(
      'should get list of tv shows from the repository when execute function is called',
      () async {
    // arrange
    when(mockTvShowRepository.getPopularTvShows())
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
    // act
    final result = await getPopularTvShows.execute();
    // assert
    verify(mockTvShowRepository.getPopularTvShows());
    expect(result, isRightThat(dummyCategoryTvShows));
  });
}
