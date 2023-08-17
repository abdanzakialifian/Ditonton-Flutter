import 'package:ditonton/data/models/movie/movie_result_response.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieModel = MovieResultResponse(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = Category(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );

  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toCategory();
    expect(result, tMovie);
  });
}
