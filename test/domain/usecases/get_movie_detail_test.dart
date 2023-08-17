import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late GetMovieDetail getMovieDetail;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovieDetail = GetMovieDetail(mockMovieRepository);
  });

  final dummyMovieId = 1;
  final dummyMovieDetailResponse = MovieDetailResponse.fromJson(
    jsonDecode(
      readJson('dummy_data/dummy_movie_detail_response.json'),
    ),
  );
  final dummyDetail = dummyMovieDetailResponse.toDetail();

  test('should get movie detail from the repository', () async {
    // arrange
    when(mockMovieRepository.getMovieDetail(dummyMovieId))
        .thenAnswer((_) async => Right(dummyDetail));
    // act
    final result = await getMovieDetail.execute(dummyMovieId);
    // assert
    verify(mockMovieRepository.getMovieDetail(dummyMovieId));
    expect(result, isRightThat(dummyDetail));
  });
}
