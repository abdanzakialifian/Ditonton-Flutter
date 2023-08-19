import 'package:ditonton/domain/entities/category.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should return category from watchlist', () {
    expect(dummyCategory, Category.fromWatchlist(dummyWatchlist));
  });
}
