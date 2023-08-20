import 'package:core/domain/entities/watchlist.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return watchlist from detail', () {
    expect(dummyWatchlist,
        Watchlist.fromDetailToWatchlist(dummyDetail, "Movies or Tv Shows"));
  });
}
