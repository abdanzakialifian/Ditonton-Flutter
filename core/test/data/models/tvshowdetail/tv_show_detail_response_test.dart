import 'dart:convert';
import 'package:core/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';

void main() {
  test("should return tv show detail response json", () {
    expect(jsonEncode(jsonDecode(dummyTvShowDetailJsonResponse)),
        jsonEncode(dummyTvShowDetailResponse.toJson()));
  });

  test("should return tv shpw detail response", () {
    expect(
        TvShowDetailResponse.fromJson(
            jsonDecode(dummyTvShowDetailJsonResponse)),
        dummyTvShowDetailResponse);
  });
}
