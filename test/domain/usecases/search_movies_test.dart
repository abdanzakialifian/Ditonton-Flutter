import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late SearchMovies searchMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    searchMovies = SearchMovies(mockMovieRepository);
  });

  final dummyQuery = 'Title';
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;

  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(dummyQuery))
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await searchMovies.execute(dummyQuery);
    // assert
    verify(mockMovieRepository.searchMovies(dummyQuery));
    expect(result, isRightThat(dummyCategories));
  });
}
