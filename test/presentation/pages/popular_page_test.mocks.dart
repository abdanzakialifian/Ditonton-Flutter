// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/presentation/pages/popular_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i8;

import 'package:ditonton/common/state_enum.dart' as _i5;
import 'package:ditonton/domain/entities/category.dart' as _i6;
import 'package:ditonton/domain/usecases/get_popular_movies.dart' as _i2;
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart' as _i3;
import 'package:ditonton/presentation/provider/popular_notifier.dart' as _i4;
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

class _FakeGetPopularMovies_0 extends _i1.SmartFake
    implements _i2.GetPopularMovies {
  _FakeGetPopularMovies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetPopularTvShows_1 extends _i1.SmartFake
    implements _i3.GetPopularTvShows {
  _FakeGetPopularTvShows_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularNotifier extends _i1.Mock implements _i4.PopularNotifier {
  MockPopularNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPopularMovies get getPopularMovies => (super.noSuchMethod(
        Invocation.getter(#getPopularMovies),
        returnValue: _FakeGetPopularMovies_0(
          this,
          Invocation.getter(#getPopularMovies),
        ),
      ) as _i2.GetPopularMovies);
  @override
  _i3.GetPopularTvShows get getPopularTvShows => (super.noSuchMethod(
        Invocation.getter(#getPopularTvShows),
        returnValue: _FakeGetPopularTvShows_1(
          this,
          Invocation.getter(#getPopularTvShows),
        ),
      ) as _i3.GetPopularTvShows);
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
  _i7.Future<void> fetchPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularMovies,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> fetchPopularTvShows() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularTvShows,
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
