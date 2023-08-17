import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetTvShowDetail getTvShowDetail;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTvShowDetail = GetTvShowDetail(mockTvShowRepository);
  });

  final dummyTvShowId = 90521;
  final dummyTvShowDetailResponse = TvShowDetailResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_tv_show_detail_response.json'),
    ),
  );
  final dummyDetail = dummyTvShowDetailResponse.toEntity();

  test('should get tv show detail from the repository', () async {
    // arrange
    when(mockTvShowRepository.getTvShowDetail(dummyTvShowId))
        .thenAnswer((_) async => Right(dummyDetail));
    // act
    final result = await getTvShowDetail.execute(dummyTvShowId);
    // assert
    verify(mockTvShowRepository.getTvShowDetail(dummyTvShowId));
    expect(result, isRightThat(dummyDetail));
  });
}
