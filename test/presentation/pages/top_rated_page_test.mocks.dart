// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/presentation/pages/top_rated_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i8;

import 'package:ditonton/common/state_enum.dart' as _i5;
import 'package:ditonton/domain/entities/category.dart' as _i6;
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart' as _i2;
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart' as _i3;
import 'package:ditonton/presentation/provider/top_rated_notifier.dart' as _i4;
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

class _FakeGetTopRatedMovies_0 extends _i1.SmartFake
    implements _i2.GetTopRatedMovies {
  _FakeGetTopRatedMovies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopRatedTvShows_1 extends _i1.SmartFake
    implements _i3.GetTopRatedTvShows {
  _FakeGetTopRatedTvShows_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TopRatedNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRatedNotifier extends _i1.Mock implements _i4.TopRatedNotifier {
  MockTopRatedNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTopRatedMovies get getTopRatedMovies => (super.noSuchMethod(
        Invocation.getter(#getTopRatedMovies),
        returnValue: _FakeGetTopRatedMovies_0(
          this,
          Invocation.getter(#getTopRatedMovies),
        ),
      ) as _i2.GetTopRatedMovies);
  @override
  _i3.GetTopRatedTvShows get getTopRatedTvShows => (super.noSuchMethod(
        Invocation.getter(#getTopRatedTvShows),
        returnValue: _FakeGetTopRatedTvShows_1(
          this,
          Invocation.getter(#getTopRatedTvShows),
        ),
      ) as _i3.GetTopRatedTvShows);
  @override
  _i5.RequestState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i5.RequestState.empty,
      ) as _i5.RequestState);
  @override
  List<_i6.Category> get data => (super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: <_i6.Category>[],
      ) as List<_i6.Category>);
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
  _i7.Future<void> fetchTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMovies,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> fetchTopRatedTvShows() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedTvShows,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
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
