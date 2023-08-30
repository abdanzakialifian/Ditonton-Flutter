// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i24;
import 'dart:typed_data' as _i25;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i9;
import 'package:ditonton/data/datasources/local/db/database_helper.dart'
    as _i20;
import 'package:ditonton/data/datasources/local/local_data_source.dart' as _i18;
import 'package:ditonton/data/datasources/remote/remote_data_source.dart'
    as _i15;
import 'package:ditonton/data/models/movie/movie_result_response.dart' as _i16;
import 'package:ditonton/data/models/movie_detail/movie_detail_response.dart'
    as _i3;
import 'package:ditonton/data/models/tv_show/tv_show_result_response.dart'
    as _i17;
import 'package:ditonton/data/models/tv_show_detail/tv_show_detail_response.dart'
    as _i4;
import 'package:ditonton/data/models/watchlist_table.dart' as _i19;
import 'package:ditonton/domain/entities/category.dart' as _i10;
import 'package:ditonton/domain/entities/detail.dart' as _i11;
import 'package:ditonton/domain/entities/watchlist.dart' as _i14;
import 'package:ditonton/domain/repositories/movie_repository.dart' as _i7;
import 'package:ditonton/domain/repositories/tv_show_repository.dart' as _i12;
import 'package:ditonton/domain/repositories/watchlist_repository.dart' as _i13;
import 'package:http/src/base_request.dart' as _i23;
import 'package:http/src/io_client.dart' as _i22;
import 'package:http/src/io_streamed_response.dart' as _i5;
import 'package:http/src/response.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i21;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvShowDetailResponse_2 extends _i1.SmartFake
    implements _i4.TvShowDetailResponse {
  _FakeTvShowDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_3 extends _i1.SmartFake
    implements _i5.IOStreamedResponse {
  _FakeIOStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i7.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getNowPlayingMovies() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingMovies,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getNowPlayingMovies,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Category>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getTopRatedMovies() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedMovies,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getTopRatedMovies,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>>.value(
            _FakeEither_0<_i9.Failure, _i11.Detail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getMovieRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getMovieRecommendations,
              [id],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getMovieRecommendations,
                [id],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Category>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
}

/// A class which mocks [TvShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRepository extends _i1.Mock implements _i12.TvShowRepository {
  MockTvShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getAiringTodayTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getAiringTodayTvShows,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getAiringTodayTvShows,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getPopularTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvShows,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getPopularTvShows,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getTopRatedTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvShows,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getTopRatedTvShows,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>> getTvShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowDetail,
          [id],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>>.value(
            _FakeEither_0<_i9.Failure, _i11.Detail>(
          this,
          Invocation.method(
            #getTvShowDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.Detail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>
      getTvShowRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvShowRecommendations,
              [id],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i10.Category>>(
              this,
              Invocation.method(
                #getTvShowRecommendations,
                [id],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>> searchTvShows(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Category>>(
          this,
          Invocation.method(
            #searchTvShows,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Category>>>);
}

/// A class which mocks [WatchlistRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistRepository extends _i1.Mock
    implements _i13.WatchlistRepository {
  MockWatchlistRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlist(
          _i14.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [watchlist],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [watchlist],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlist(
          _i14.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlist],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [watchlist],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, bool>>.value(
            _FakeEither_0<_i9.Failure, bool>(
          this,
          Invocation.method(
            #isAddedToWatchlist,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, bool>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i14.Watchlist>>> getWatchlist() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i14.Watchlist>>>.value(
                _FakeEither_0<_i9.Failure, List<_i14.Watchlist>>(
          this,
          Invocation.method(
            #getWatchlist,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i14.Watchlist>>>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i15.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i16.MovieResultResponse>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i8.Future<List<_i16.MovieResultResponse>>.value(
            <_i16.MovieResultResponse>[]),
      ) as _i8.Future<List<_i16.MovieResultResponse>>);
  @override
  _i8.Future<List<_i17.TvShowResultResponse>> getAiringTodayTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAiringTodayTvShows,
          [],
        ),
        returnValue: _i8.Future<List<_i17.TvShowResultResponse>>.value(
            <_i17.TvShowResultResponse>[]),
      ) as _i8.Future<List<_i17.TvShowResultResponse>>);
  @override
  _i8.Future<List<_i16.MovieResultResponse>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i8.Future<List<_i16.MovieResultResponse>>.value(
            <_i16.MovieResultResponse>[]),
      ) as _i8.Future<List<_i16.MovieResultResponse>>);
  @override
  _i8.Future<List<_i17.TvShowResultResponse>> getPopularTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShows,
          [],
        ),
        returnValue: _i8.Future<List<_i17.TvShowResultResponse>>.value(
            <_i17.TvShowResultResponse>[]),
      ) as _i8.Future<List<_i17.TvShowResultResponse>>);
  @override
  _i8.Future<List<_i16.MovieResultResponse>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i8.Future<List<_i16.MovieResultResponse>>.value(
            <_i16.MovieResultResponse>[]),
      ) as _i8.Future<List<_i16.MovieResultResponse>>);
  @override
  _i8.Future<List<_i17.TvShowResultResponse>> getTopRatedTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvShows,
          [],
        ),
        returnValue: _i8.Future<List<_i17.TvShowResultResponse>>.value(
            <_i17.TvShowResultResponse>[]),
      ) as _i8.Future<List<_i17.TvShowResultResponse>>);
  @override
  _i8.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.MovieDetailResponse>);
  @override
  _i8.Future<_i4.TvShowDetailResponse> getTvShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowDetail,
          [id],
        ),
        returnValue: _i8.Future<_i4.TvShowDetailResponse>.value(
            _FakeTvShowDetailResponse_2(
          this,
          Invocation.method(
            #getTvShowDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i4.TvShowDetailResponse>);
  @override
  _i8.Future<List<_i16.MovieResultResponse>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i8.Future<List<_i16.MovieResultResponse>>.value(
            <_i16.MovieResultResponse>[]),
      ) as _i8.Future<List<_i16.MovieResultResponse>>);
  @override
  _i8.Future<List<_i17.TvShowResultResponse>> getTvShowRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowRecommendations,
          [id],
        ),
        returnValue: _i8.Future<List<_i17.TvShowResultResponse>>.value(
            <_i17.TvShowResultResponse>[]),
      ) as _i8.Future<List<_i17.TvShowResultResponse>>);
  @override
  _i8.Future<List<_i16.MovieResultResponse>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i8.Future<List<_i16.MovieResultResponse>>.value(
            <_i16.MovieResultResponse>[]),
      ) as _i8.Future<List<_i16.MovieResultResponse>>);
  @override
  _i8.Future<List<_i17.TvShowResultResponse>> searchTvShows(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue: _i8.Future<List<_i17.TvShowResultResponse>>.value(
            <_i17.TvShowResultResponse>[]),
      ) as _i8.Future<List<_i17.TvShowResultResponse>>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i18.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchlist(_i19.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlistTable],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> removeWatchlist(_i19.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlistTable],
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i19.WatchlistTable?> getWatchlistById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [id],
        ),
        returnValue: _i8.Future<_i19.WatchlistTable?>.value(),
      ) as _i8.Future<_i19.WatchlistTable?>);
  @override
  _i8.Future<List<_i19.WatchlistTable>> getWatchlists() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlists,
          [],
        ),
        returnValue: _i8.Future<List<_i19.WatchlistTable>>.value(
            <_i19.WatchlistTable>[]),
      ) as _i8.Future<List<_i19.WatchlistTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i20.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set setDatabase(_i21.Database? _setDatabase) => super.noSuchMethod(
        Invocation.setter(
          #setDatabase,
          _setDatabase,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i21.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i8.Future<_i21.Database?>.value(),
      ) as _i8.Future<_i21.Database?>);
  @override
  _i8.Future<int> insertWatchlist(_i19.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlistTable],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> removeWatchlist(_i19.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlistTable],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<Map<String, dynamic>?> getWatchlistById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);
  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlist() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i22.IOClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.IOStreamedResponse> send(_i23.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i5.IOStreamedResponse>.value(_FakeIOStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i5.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i24.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i25.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i25.Uint8List>.value(_i25.Uint8List(0)),
      ) as _i8.Future<_i25.Uint8List>);
}
