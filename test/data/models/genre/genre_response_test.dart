import 'package:ditonton/data/models/genre/genre_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  final dummyJson = {
    'id': 1,
    'name': "Adventure",
  };

  test('should return genre response json', () {
    expect(dummyJson, dummyGenreResponse.toJson());
  });

  test("should return watchlist table", () {
    expect(GenreResponse.fromJson(dummyJson), dummyGenreResponse);
  });
}
