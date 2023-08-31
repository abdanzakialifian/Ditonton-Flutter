import 'package:data/models/watchlist_table.dart';
import 'package:flutter_test/flutter_test.dart';
import '../dummy_data/dummy_objects.dart';

void main() {
  test("should return watchlist table json", () {
    expect(dummyWatchlistTable.toJson(), dummyWatchlistMap);
  });

  test("should return watchlist table", () {
    expect(WatchlistTable.fromMap(dummyWatchlistMap), dummyWatchlistTable);
  });
}
