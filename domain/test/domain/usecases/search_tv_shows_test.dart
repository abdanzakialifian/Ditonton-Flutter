import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/search_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvShows searchTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    searchTvShows = SearchTvShows(mockTvShowRepository);
  });

  const dummyQuery = 'Here it all begins';

  test('should get list of tv shows from the repository', () async {
    // arrange
    when(mockTvShowRepository.searchTvShows(dummyQuery))
        .thenAnswer((_) async => Right(dummyCategoryTvShows ?? []));
    // act
    final result = await searchTvShows.execute(dummyQuery);
    // assert
    verify(mockTvShowRepository.searchTvShows(dummyQuery));
    expect(result, isRightThat(dummyCategoryTvShows));
  });
}
