import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/tvshow/tv_show_response.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetTvShowRecommendations getTvShowRecommendations;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTvShowRecommendations = GetTvShowRecommendations(mockTvShowRepository);
  });

  final dummyTvShowId = 90521;
  final dummyTvShowResponse = TvShowResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_response.json'),
    ),
  ).tvShowList;

  final dummyCategories =
      dummyTvShowResponse?.map((model) => model.toCategory()).toList();

  test('should get list of tv shows recommendations from the repository',
      () async {
    // arrange
    when(mockTvShowRepository.getTvShowRecommendations(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyCategories ?? []));
    // act
    final result = await getTvShowRecommendations.execute(dummyTvShowId);
    // assert
    verify(mockTvShowRepository.getTvShowRecommendations(dummyTvShowId));
    expect(result, isRightThat(dummyCategories));
  });
}
