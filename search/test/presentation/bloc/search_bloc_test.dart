import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv_shows.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:search/presentation/bloc/search_event.dart';
import 'package:search/presentation/bloc/search_state.dart';
import '../../dummy_data/dummy_objects.dart';
import '../provider/search_notifier_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvShows])
void main() {
  late SearchBloc searchBloc;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvShows mockSearchTvShows;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    mockSearchTvShows = MockSearchTvShows();
    searchBloc = SearchBloc(mockSearchMovies, mockSearchTvShows);
  });

  const dummyQueryMovie = "Title";

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmpty());
  });

  blocTest<SearchBloc, SearchState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => Right(dummyCategoryMovies ?? []));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged(query: dummyQueryMovie)),
    wait: const Duration(milliseconds: 500),
    expect: () =>
        [SearchLoading(), SearchHasData(result: dummyCategoryMovies ?? [])],
    verify: (bloc) => verify(mockSearchMovies.execute(dummyQueryMovie)),
  );

  blocTest<SearchBloc, SearchState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchMovies.execute(dummyQueryMovie))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged(query: dummyQueryMovie)),
    wait: const Duration(milliseconds: 500),
    expect: () =>
        [SearchLoading(), const SearchError(message: 'Server Failure')],
    verify: (bloc) => verify(mockSearchMovies.execute(dummyQueryMovie)),
  );
}
