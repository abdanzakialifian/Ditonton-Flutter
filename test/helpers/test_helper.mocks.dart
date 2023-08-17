// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i21;
import 'dart:typed_data' as _i22;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i8;
import 'package:ditonton/data/datasources/local/db/database_helper.dart'
    as _i19;
import 'package:ditonton/data/datasources/local/local_data_source.dart' as _i17;
import 'package:ditonton/data/datasources/remote/remote_data_source.dart'
    as _i14;
import 'package:ditonton/data/models/movie/movie_result_response.dart' as _i15;
import 'package:ditonton/data/models/moviedetail/movie_detail_response.dart'
    as _i3;
import 'package:ditonton/data/models/tvshow/tv_show_result_response.dart'
    as _i16;
import 'package:ditonton/data/models/tvshowdetail/tv_show_detail_response.dart'
    as _i4;
import 'package:ditonton/data/models/watchlist_table.dart' as _i18;
import 'package:ditonton/domain/entities/category.dart' as _i9;
import 'package:ditonton/domain/entities/detail.dart' as _i10;
import 'package:ditonton/domain/entities/watchlist.dart' as _i13;
import 'package:ditonton/domain/repositories/movie_repository.dart' as _i6;
import 'package:ditonton/domain/repositories/tv_show_repository.dart' as _i11;
import 'package:ditonton/domain/repositories/watchlist_repository.dart' as _i12;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i20;

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

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
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
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>
      getNowPlayingMovies() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingMovies,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i9.Category>>(
              this,
              Invocation.method(
                #getNowPlayingMovies,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Category>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Category>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>>.value(
            _FakeEither_0<_i8.Failure, _i10.Detail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>
      getMovieRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getMovieRecommendations,
              [id],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i9.Category>>(
              this,
              Invocation.method(
                #getMovieRecommendations,
                [id],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Category>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
}

/// A class which mocks [TvShowRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvShowRepository extends _i1.Mock implements _i11.TvShowRepository {
  MockTvShowRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>
      getAiringTodayTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getAiringTodayTvShows,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i9.Category>>(
              this,
              Invocation.method(
                #getAiringTodayTvShows,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>> getPopularTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShows,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Category>>(
          this,
          Invocation.method(
            #getPopularTvShows,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>
      getTopRatedTvShows() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvShows,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i9.Category>>(
              this,
              Invocation.method(
                #getTopRatedTvShows,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>> getTvShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowDetail,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>>.value(
            _FakeEither_0<_i8.Failure, _i10.Detail>(
          this,
          Invocation.method(
            #getTvShowDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.Detail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>
      getTvShowRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvShowRecommendations,
              [id],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i9.Category>>(
              this,
              Invocation.method(
                #getTvShowRecommendations,
                [id],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>> searchTvShows(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Category>>(
          this,
          Invocation.method(
            #searchTvShows,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Category>>>);
}

/// A class which mocks [WatchlistRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistRepository extends _i1.Mock
    implements _i12.WatchlistRepository {
  MockWatchlistRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i13.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [watchlist],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [watchlist],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i13.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlist],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [watchlist],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Watchlist>>> getWatchlist() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i13.Watchlist>>>.value(
                _FakeEither_0<_i8.Failure, List<_i13.Watchlist>>(
          this,
          Invocation.method(
            #getWatchlist,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Watchlist>>>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i14.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i15.MovieResultResponse>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i7.Future<List<_i15.MovieResultResponse>>.value(
            <_i15.MovieResultResponse>[]),
      ) as _i7.Future<List<_i15.MovieResultResponse>>);
  @override
  _i7.Future<List<_i16.TvShowResultResponse>> getAiringTodayTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAiringTodayTvShows,
          [],
        ),
        returnValue: _i7.Future<List<_i16.TvShowResultResponse>>.value(
            <_i16.TvShowResultResponse>[]),
      ) as _i7.Future<List<_i16.TvShowResultResponse>>);
  @override
  _i7.Future<List<_i15.MovieResultResponse>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i7.Future<List<_i15.MovieResultResponse>>.value(
            <_i15.MovieResultResponse>[]),
      ) as _i7.Future<List<_i15.MovieResultResponse>>);
  @override
  _i7.Future<List<_i16.TvShowResultResponse>> getPopularTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvShows,
          [],
        ),
        returnValue: _i7.Future<List<_i16.TvShowResultResponse>>.value(
            <_i16.TvShowResultResponse>[]),
      ) as _i7.Future<List<_i16.TvShowResultResponse>>);
  @override
  _i7.Future<List<_i15.MovieResultResponse>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i7.Future<List<_i15.MovieResultResponse>>.value(
            <_i15.MovieResultResponse>[]),
      ) as _i7.Future<List<_i15.MovieResultResponse>>);
  @override
  _i7.Future<List<_i16.TvShowResultResponse>> getTopRatedTvShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvShows,
          [],
        ),
        returnValue: _i7.Future<List<_i16.TvShowResultResponse>>.value(
            <_i16.TvShowResultResponse>[]),
      ) as _i7.Future<List<_i16.TvShowResultResponse>>);
  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i7.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.MovieDetailResponse>);
  @override
  _i7.Future<_i4.TvShowDetailResponse> getTvShowDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowDetail,
          [id],
        ),
        returnValue: _i7.Future<_i4.TvShowDetailResponse>.value(
            _FakeTvShowDetailResponse_2(
          this,
          Invocation.method(
            #getTvShowDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i4.TvShowDetailResponse>);
  @override
  _i7.Future<List<_i15.MovieResultResponse>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i7.Future<List<_i15.MovieResultResponse>>.value(
            <_i15.MovieResultResponse>[]),
      ) as _i7.Future<List<_i15.MovieResultResponse>>);
  @override
  _i7.Future<List<_i16.TvShowResultResponse>> getTvShowRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvShowRecommendations,
          [id],
        ),
        returnValue: _i7.Future<List<_i16.TvShowResultResponse>>.value(
            <_i16.TvShowResultResponse>[]),
      ) as _i7.Future<List<_i16.TvShowResultResponse>>);
  @override
  _i7.Future<List<_i15.MovieResultResponse>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i7.Future<List<_i15.MovieResultResponse>>.value(
            <_i15.MovieResultResponse>[]),
      ) as _i7.Future<List<_i15.MovieResultResponse>>);
  @override
  _i7.Future<List<_i16.TvShowResultResponse>> searchTvShows(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue: _i7.Future<List<_i16.TvShowResultResponse>>.value(
            <_i16.TvShowResultResponse>[]),
      ) as _i7.Future<List<_i16.TvShowResultResponse>>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i17.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i18.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlistTable],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i18.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlistTable],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i18.WatchlistTable?> getWatchlistById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [id],
        ),
        returnValue: _i7.Future<_i18.WatchlistTable?>.value(),
      ) as _i7.Future<_i18.WatchlistTable?>);
  @override
  _i7.Future<List<_i18.WatchlistTable>> getWatchlists() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlists,
          [],
        ),
        returnValue: _i7.Future<List<_i18.WatchlistTable>>.value(
            <_i18.WatchlistTable>[]),
      ) as _i7.Future<List<_i18.WatchlistTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i19.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i20.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i20.Database?>.value(),
      ) as _i7.Future<_i20.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i18.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlistTable],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i18.WatchlistTable? watchlistTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlistTable],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getWatchlistById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlist() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
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
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
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
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
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
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
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
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i22.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i22.Uint8List>.value(_i22.Uint8List(0)),
      ) as _i7.Future<_i22.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
