// Mocks generated by Mockito 5.4.2 from annotations
// in ditonton/test/presentation/provider/detail_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i5;
import 'package:ditonton/domain/entities/category.dart' as _i8;
import 'package:ditonton/domain/entities/detail.dart' as _i6;
import 'package:ditonton/domain/usecases/get_movie_detail.dart' as _i3;
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart' as _i7;
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart' as _i9;
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart'
    as _i10;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetMovieDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetail extends _i1.Mock implements _i3.GetMovieDetail {
  MockGetMovieDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>>.value(
            _FakeEither_0<_i5.Failure, _i6.Detail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>>);
}

/// A class which mocks [GetMovieRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieRecommendations extends _i1.Mock
    implements _i7.GetMovieRecommendations {
  MockGetMovieRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.Category>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>>);
}

/// A class which mocks [GetTvShowDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvShowDetail extends _i1.Mock implements _i9.GetTvShowDetail {
  MockGetTvShowDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>>.value(
            _FakeEither_0<_i5.Failure, _i6.Detail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Detail>>);
}

/// A class which mocks [GetTvShowRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvShowRecommendations extends _i1.Mock
    implements _i10.GetTvShowRecommendations {
  MockGetTvShowRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.Category>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Category>>>);
}
