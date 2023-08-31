import 'package:data/datasources/local/db/database_helper.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/datasources/remote/remote_data_source.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:domain/repositories/tv_show_repository.dart';
import 'package:domain/repositories/watchlist_repository.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  TvShowRepository,
  WatchlistRepository,
  RemoteDataSource,
  LocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
