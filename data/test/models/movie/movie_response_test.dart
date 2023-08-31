import 'package:data/models/movie/movie_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  test("should return movie response json", () {
    expect(dummyMovieResponseMap, dummyMovieResponse.toJson());
  });

  test("should return movie response", () {
    expect(dummyMovieResponse, MovieResponse.fromJson(dummyMovieResponseMap));
  });
}
