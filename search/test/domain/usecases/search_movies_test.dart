import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_movies.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchMovies searchMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    searchMovies = SearchMovies(mockMovieRepository);
  });

  const dummyQuery = 'Title';

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(dummyQuery))
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
    // act
    final result = await searchMovies.execute(dummyQuery);
    // assert
    verify(mockMovieRepository.searchMovies(dummyQuery));
    expect(result, isRightThat(dummyCategoryMovies));
  });
}
