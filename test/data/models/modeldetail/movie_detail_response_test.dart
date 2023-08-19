import 'dart:convert';

import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final dummyMovieDetailJson = jsonDecode(
    readJson('dummy_data/dummy_movie_detail_response.json'),
  );
  final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_detail_response.json'),
    ),
  );

  test("should return movie detail response json", () {
    expect(jsonEncode(dummyMovieDetailJson),
        jsonEncode(dummyMovieDetailResponse.toJson()));
  });

  test("should return movie detail response", () {
    expect(MovieDetailResponse.fromJson(dummyMovieDetailJson),
        dummyMovieDetailResponse);
  });
}
