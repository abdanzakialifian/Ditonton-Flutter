import 'dart:convert';

import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final dummyTvShowDetailJson = jsonDecode(
    readJson('dummy_data/dummy_tv_show_detail_response.json'),
  );
  final dummyTvShowDetailResponse = TvShowDetailResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_detail_response.json'),
    ),
  );

  test("should return tv show detail response json", () {
    expect(jsonEncode(dummyTvShowDetailJson),
        jsonEncode(dummyTvShowDetailResponse.toJson()));
  });

  test("should return tv shpw detail response", () {
    expect(TvShowDetailResponse.fromJson(dummyTvShowDetailJson),
        dummyTvShowDetailResponse);
  });
}
