import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowPlayingMovies getNowPlayingMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getNowPlayingMovies = GetNowPlayingMovies(mockMovieRepository);
  });

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getNowPlayingMovies())
        .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
    // act
    final result = await getNowPlayingMovies.execute();
    // assert
    verify(mockMovieRepository.getNowPlayingMovies());
    expect(result, isRightThat(dummyCategoryMovies));
  });
}
