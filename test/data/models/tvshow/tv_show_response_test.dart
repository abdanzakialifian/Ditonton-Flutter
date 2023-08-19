import 'dart:convert';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../json_reader.dart';

void main() {
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  );

  final dummyJson = {
    "results": [
      {
        "backdrop_path": "/yYNa1nqvNK94xZz3eKyfvZdAvPi.jpg",
        "first_air_date": "2020-11-02",
        "genre_ids": [10766],
        "id": 112470,
        "name": "Here it all begins",
        "origin_country": ["FR"],
        "original_language": "fr",
        "original_name": "Ici tout commence",
        "overview": "overview",
        "popularity": 5208.508,
        "poster_path": "/60cqjI590JKXCAABqCStVmSBGET.jpg",
        "vote_average": 6.7,
        "vote_count": 17
      }
    ],
  };

  test("should return tv show response json", () {
    expect(dummyJson, dummyTvShowResponse.toJson());
  });

  test("should return tv show response", () {
    expect(dummyTvShowResponse, TvShowResponse.fromJson(dummyJson));
  });
}
