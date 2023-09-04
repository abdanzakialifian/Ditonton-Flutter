import 'package:data/datasources/local/db/database_helper.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/datasources/remote/remote_data_source.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
