import 'dart:convert';
import 'package:ditonton/data/models/movie_detail/movie_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';

void main() {
  test("should return movie detail response json", () {
    expect(jsonEncode(jsonDecode(dummyMovieDetailJsonResponse)),
        jsonEncode(dummyMovieDetailResponse.toJson()));
  });

  test("should return movie detail response", () {
    expect(
        MovieDetailResponse.fromJson(jsonDecode(dummyMovieDetailJsonResponse)),
        dummyMovieDetailResponse);
  });
}
