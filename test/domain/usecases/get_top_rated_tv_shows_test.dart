import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetTopRatedTvShows getTopRatedTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTopRatedTvShows = GetTopRatedTvShows(mockTvShowRepository);
  });

  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;

  final dummyCategories =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  test('should get list of tv shows from repository', () async {
    // arrange
    when(mockTvShowRepository.getTopRatedTvShows())
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await getTopRatedTvShows.execute();
    // assert
    verify(mockTvShowRepository.getTopRatedTvShows());
    expect(result, isRightThat(dummyCategories));
  });
}
