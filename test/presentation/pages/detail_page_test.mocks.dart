// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/presentation/pages/detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;
import 'dart:ui' as _i15;

import 'package:ditonton/common/state_enum.dart' as _i12;
import 'package:ditonton/domain/entities/category.dart' as _i13;
import 'package:ditonton/domain/entities/detail.dart' as _i6;
import 'package:ditonton/domain/entities/watchlist.dart' as _i17;
import 'package:ditonton/domain/usecases/get_movie_detail.dart' as _i2;
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart' as _i3;
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart' as _i4;
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart'
    as _i5;
import 'package:ditonton/domain/usecases/get_watchlist.dart' as _i7;
import 'package:ditonton/domain/usecases/get_watchlist_status.dart' as _i8;
import 'package:ditonton/domain/usecases/remove_watchlist.dart' as _i9;
import 'package:ditonton/domain/usecases/save_watchlist.dart' as _i10;
import 'package:ditonton/presentation/provider/detail_notifier.dart' as _i11;
import 'package:ditonton/presentation/provider/watchlist_notifier.dart' as _i16;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeGetMovieDetail_0 extends _i1.SmartFake
    implements _i2.GetMovieDetail {
  _FakeGetMovieDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMovieRecommendations_1 extends _i1.SmartFake
    implements _i3.GetMovieRecommendations {
  _FakeGetMovieRecommendations_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvShowDetail_2 extends _i1.SmartFake
    implements _i4.GetTvShowDetail {
  _FakeGetTvShowDetail_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvShowRecommendations_3 extends _i1.SmartFake
    implements _i5.GetTvShowRecommendations {
  _FakeGetTvShowRecommendations_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDetail_4 extends _i1.SmartFake implements _i6.Detail {
  _FakeDetail_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchlist_5 extends _i1.SmartFake implements _i7.GetWatchlist {
  _FakeGetWatchlist_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchListStatus_6 extends _i1.SmartFake
    implements _i8.GetWatchListStatus {
  _FakeGetWatchListStatus_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlist_7 extends _i1.SmartFake
    implements _i9.RemoveWatchlist {
  _FakeRemoveWatchlist_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlist_8 extends _i1.SmartFake implements _i10.SaveWatchlist {
  _FakeSaveWatchlist_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockDetailNotifier extends _i1.Mock implements _i11.DetailNotifier {
  MockDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieDetail get getMovieDetail => (super.noSuchMethod(
        Invocation.getter(#getMovieDetail),
        returnValue: _FakeGetMovieDetail_0(
          this,
          Invocation.getter(#getMovieDetail),
        ),
      ) as _i2.GetMovieDetail);
  @override
  _i3.GetMovieRecommendations get getMovieRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getMovieRecommendations),
        returnValue: _FakeGetMovieRecommendations_1(
          this,
          Invocation.getter(#getMovieRecommendations),
        ),
      ) as _i3.GetMovieRecommendations);
  @override
  _i4.GetTvShowDetail get getTvShowDetail => (super.noSuchMethod(
        Invocation.getter(#getTvShowDetail),
        returnValue: _FakeGetTvShowDetail_2(
          this,
          Invocation.getter(#getTvShowDetail),
        ),
      ) as _i4.GetTvShowDetail);
  @override
  _i5.GetTvShowRecommendations get getTvShowRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getTvShowRecommendations),
        returnValue: _FakeGetTvShowRecommendations_3(
          this,
          Invocation.getter(#getTvShowRecommendations),
        ),
      ) as _i5.GetTvShowRecommendations);
  @override
  _i6.Detail get detail => (super.noSuchMethod(
        Invocation.getter(#detail),
        returnValue: _FakeDetail_4(
          this,
          Invocation.getter(#detail),
        ),
      ) as _i6.Detail);
  @override
  _i12.RequestState get detailState => (super.noSuchMethod(
        Invocation.getter(#detailState),
        returnValue: _i12.RequestState.Empty,
      ) as _i12.RequestState);
  @override
  List<_i13.Category> get recommendations => (super.noSuchMethod(
        Invocation.getter(#recommendations),
        returnValue: <_i13.Category>[],
      ) as List<_i13.Category>);
  @override
  _i12.RequestState get recommendationState => (super.noSuchMethod(
        Invocation.getter(#recommendationState),
        returnValue: _i12.RequestState.Empty,
      ) as _i12.RequestState);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i14.Future<void> fetchMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  _i14.Future<void> fetchTvShowDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchTvShowDetail,
          [id],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  void addListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [WatchlistNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistNotifier extends _i1.Mock implements _i16.WatchlistNotifier {
  MockWatchlistNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.GetWatchlist get getWatchlist => (super.noSuchMethod(
        Invocation.getter(#getWatchlist),
        returnValue: _FakeGetWatchlist_5(
          this,
          Invocation.getter(#getWatchlist),
        ),
      ) as _i7.GetWatchlist);
  @override
  _i8.GetWatchListStatus get getWatchListStatus => (super.noSuchMethod(
        Invocation.getter(#getWatchListStatus),
        returnValue: _FakeGetWatchListStatus_6(
          this,
          Invocation.getter(#getWatchListStatus),
        ),
      ) as _i8.GetWatchListStatus);
  @override
  _i9.RemoveWatchlist get removeWatchlist => (super.noSuchMethod(
        Invocation.getter(#removeWatchlist),
        returnValue: _FakeRemoveWatchlist_7(
          this,
          Invocation.getter(#removeWatchlist),
        ),
      ) as _i9.RemoveWatchlist);
  @override
  _i10.SaveWatchlist get saveWatchlist => (super.noSuchMethod(
        Invocation.getter(#saveWatchlist),
        returnValue: _FakeSaveWatchlist_8(
          this,
          Invocation.getter(#saveWatchlist),
        ),
      ) as _i10.SaveWatchlist);
  @override
  List<_i17.Watchlist> get watchlist => (super.noSuchMethod(
        Invocation.getter(#watchlist),
        returnValue: <_i17.Watchlist>[],
      ) as List<_i17.Watchlist>);
  @override
  _i12.RequestState get watchlistState => (super.noSuchMethod(
        Invocation.getter(#watchlistState),
        returnValue: _i12.RequestState.Empty,
      ) as _i12.RequestState);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  bool get isAddedToWatchlist => (super.noSuchMethod(
        Invocation.getter(#isAddedToWatchlist),
        returnValue: false,
      ) as bool);
  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: '',
      ) as String);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i14.Future<void> fetchWatchlist() => (super.noSuchMethod(
        Invocation.method(
          #fetchWatchlist,
          [],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  _i14.Future<void> addWatchlist(_i17.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [watchlist],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  _i14.Future<void> removeFromWatchlist(_i17.Watchlist? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [watchlist],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  _i14.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i14.Future<void>.value(),
        returnValueForMissingStub: _i14.Future<void>.value(),
      ) as _i14.Future<void>);
  @override
  void addListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
