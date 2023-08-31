import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedMovies getTopRatedMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getTopRatedMovies = GetTopRatedMovies(mockMovieRepository);
  });

  test('should get list of movies from repository', () async {
    // arrange
    when(mockMovieRepository.getTopRatedMovies())
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
    // act
    final result = await getTopRatedMovies.execute();
    // assert
    verify(mockMovieRepository.getTopRatedMovies());
    expect(result, isRightThat(dummyCategoryMovies));
  });
}
