import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularMovies getPopularMovies;
  late MockMovieRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockMovieRepository();
    getPopularMovies = GetPopularMovies(mockMovieRpository);
  });

  test(
      'should get list of movies from the repository when execute function is called',
      () async {
    // arrange
    when(mockMovieRpository.getPopularMovies())
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
    // act
    final result = await getPopularMovies.execute();
    // assert
    verify(mockMovieRpository.getPopularMovies());
    expect(result, isRightThat(dummyCategoryMovies));
  });
}
