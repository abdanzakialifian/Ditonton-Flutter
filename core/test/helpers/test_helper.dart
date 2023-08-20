import 'package:core/data/datasources/local/db/database_helper.dart';
import 'package:core/data/datasources/local/local_data_source.dart';
import 'package:core/data/datasources/remote/remote_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';
import 'package:core/domain/repositories/watchlist_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  TvShowRepository,
  WatchlistRepository,
  RemoteDataSource,
  LocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
