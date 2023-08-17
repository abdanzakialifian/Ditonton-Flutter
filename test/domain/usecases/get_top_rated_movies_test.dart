import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetTopRatedMovies getTopRatedMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getTopRatedMovies = GetTopRatedMovies(mockMovieRepository);
  });

  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;

  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  test('should get list of movies from repository', () async {
    // arrange
    when(mockMovieRepository.getTopRatedMovies())
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await getTopRatedMovies.execute();
    // assert
    verify(mockMovieRepository.getTopRatedMovies());
    expect(result, isRightThat(dummyCategories));
  });
}
