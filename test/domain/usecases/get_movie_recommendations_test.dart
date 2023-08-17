import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetMovieRecommendations getMovieRecommendations;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovieRecommendations = GetMovieRecommendations(mockMovieRepository);
  });

  final dummyMovieId = 1;
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  ).movieList;

  final dummyCategories =
      dummyMoviesResponse?.map((model) => model.toCategory()).toList();

  test('should get list of movie recommendations from the repository',
      () async {
    // arrange
    when(mockMovieRepository.getMovieRecommendations(dummyMovieId))
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await getMovieRecommendations.execute(dummyMovieId);
    // assert
    verify(mockMovieRepository.getMovieRecommendations(dummyMovieId));
    expect(result, isRightThat(dummyCategories));
  });
}
