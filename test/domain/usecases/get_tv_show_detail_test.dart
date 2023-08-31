import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:domain/usecases/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowDetail getTvShowDetail;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    getTvShowDetail = GetTvShowDetail(mockTvShowRepository);
  });

  const dummyTvShowId = 90521;
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
