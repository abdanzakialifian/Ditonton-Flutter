import 'package:domain/repositories/movie_repository.dart';
import 'package:domain/repositories/tv_show_repository.dart';
import 'package:domain/repositories/watchlist_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    MovieRepository,
    TvShowRepository,
    WatchlistRepository,
  ],
)
void main() {}
