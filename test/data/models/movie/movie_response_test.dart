import 'dart:convert';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../json_reader.dart';

void main() {
  final dummyMoviesResponse = MovieResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_response.json'),
    ),
  );

  final dummyJson = {
    "results": [
      {
        "adult": false,
        "backdrop_path": "/path.jpg",
        "genre_ids": [1, 2, 3, 4],
        "id": 1,
        "original_language": "en",
        "original_title": "Original Title",
        "overview": "Overview",
        "popularity": 1.0,
        "poster_path": "/path.jpg",
        "release_date": "2020-05-05",
        "title": "Title",
        "video": false,
        "vote_average": 1.0,
        "vote_count": 1
      }
    ],
  };

  test("should return movie response json", () {
    expect(dummyJson, dummyMoviesResponse.toJson());
  });

  test("should return movie response", () {
    expect(dummyMoviesResponse, MovieResponse.fromJson(dummyJson));
  });
}
