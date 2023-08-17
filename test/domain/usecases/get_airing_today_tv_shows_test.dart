import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetAiringTodayTvShows getAiringTodayTvShows;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getAiringTodayTvShows = GetAiringTodayTvShows(mockTvShowRepository);
  });

  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;

  final dummyCategories =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  test('should get list of tv shows from the repository', () async {
    // arrange
    when(mockTvShowRepository.getAiringTodayTvShows())
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await getAiringTodayTvShows.execute();
    // assert
    verify(mockTvShowRepository.getAiringTodayTvShows());
    expect(result, isRightThat(dummyCategories));
  });
}
