import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../dummy_data/dummy_objects.dart';
import '../helpers/test_helper.mocks.dart';

void main() {
  late GetMovieRecommendations getMovieRecommendations;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovieRecommendations = GetMovieRecommendations(mockMovieRepository);
  });

  const dummyMovieId = 1;

  test('should get list of movie recommendations from the repository',
      () async {
    // arrange
    when(mockMovieRepository.getMovieRecommendations(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
    // act
    final result = await getMovieRecommendations.execute(dummyMovieId);
    // assert
    verify(mockMovieRepository.getMovieRecommendations(dummyMovieId));
    expect(result, isRightThat(dummyCategoryMovies));
  });
}
