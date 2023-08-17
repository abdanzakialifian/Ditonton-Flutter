import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'top_rated_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    notifier = TopRatedNotifier(mockGetTopRatedMovies)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tMovie = Category(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );

  final tMovieList = <Category>[tMovie];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => Right(tMovieList));
    // act
    notifier.fetchTopRatedMovies();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => Right(tMovieList));
    // act
    await notifier.fetchTopRatedMovies();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.data, tMovieList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedMovies.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTopRatedMovies();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
