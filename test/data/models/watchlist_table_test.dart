import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  final dummyJson = {
    'id': 1,
    'title': "title",
    'posterPath': "posterPath",
    'overview': "overview",
    'category': "Movies or Tv Shows"
  };

  test("should return watchlist table json", () {
    expect(dummyWatchlistTable.toJson(), dummyJson);
  });

  test("should return watchlist table", () {
    expect(WatchlistTable.fromMap(dummyJson), dummyWatchlistTable);
  });
}
