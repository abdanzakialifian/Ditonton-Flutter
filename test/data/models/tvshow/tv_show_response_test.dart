import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';

void main() {
  test("should return tv show response json", () {
    expect(dummyTvShowResponseMap, dummyTvShowResponse.toJson());
  });

  test("should return tv show response", () {
    expect(
        dummyTvShowResponse, TvShowResponse.fromJson(dummyTvShowResponseMap));
  });
}
