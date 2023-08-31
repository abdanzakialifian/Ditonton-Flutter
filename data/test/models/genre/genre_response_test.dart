import 'package:data/models/genre/genre_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return genre response json', () {
    expect(dummyGenreResponseMap, dummyGenreResponse.toJson());
  });

  test("should return genre response", () {
    expect(GenreResponse.fromJson(dummyGenreResponseMap), dummyGenreResponse);
  });
}
