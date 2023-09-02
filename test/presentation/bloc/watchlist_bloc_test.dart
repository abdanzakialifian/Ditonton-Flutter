import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:domain/usecases/get_watchlist.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/remove_watchlist.dart' as usecase;
import 'package:domain/usecases/save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_bloc_test.mocks.dart';

@GenerateMocks(
  [GetWatchlist, GetWatchListStatus, usecase.RemoveWatchlist, SaveWatchlist],
)
void main() {
  late WatchlistBloc watchlistBloc;
  late MockGetWatchlist mockGetWatchlist;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockSaveWatchlist mockSaveWatchlist;

  setUp(() {
    mockGetWatchlist = MockGetWatchlist();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockSaveWatchlist = MockSaveWatchlist();
    watchlistBloc = WatchlistBloc(
      mockGetWatchlist,
      mockGetWatchListStatus,
      mockRemoveWatchlist,
      mockSaveWatchlist,
    );
  });

  final Watchlist dummyWatchlist = dummyWatchlistTable.toWatchlist();

  test("initial state shoud be empty", () {
    expect(
      watchlistBloc.state,
      WatchlistContainerState.initialState(),
    );
  });

  group(
    'Watchlist',
    () {
      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Loading, HasData] when watchlist is gotten successfully',
        build: () {
          when(mockGetWatchlist.execute()).thenAnswer(
            (_) async => Right(
              [dummyWatchlist],
            ),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlist()),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistLoading(),
          ),
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistData([dummyWatchlist]),
          )
        ],
        verify: (bloc) {
          verify(
            mockGetWatchlist.execute(),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Loading, HasData] when watchlist is gotten successfully but watchlist empty',
        build: () {
          when(mockGetWatchlist.execute()).thenAnswer(
            (_) async => const Right([]),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlist()),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistLoading(),
          ),
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistEmpty(),
          )
        ],
        verify: (bloc) {
          verify(
            mockGetWatchlist.execute(),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Loading, Error] when get watchlist is unsuccessful',
        build: () {
          when(mockGetWatchlist.execute()).thenAnswer(
            (_) async => const Left(
              DatabaseFailure("Can't get data"),
            ),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlist()),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistLoading(),
          ),
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistError("Can't get data"),
          )
        ],
        verify: (bloc) {
          verify(
            mockGetWatchlist.execute(),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [HasData] when add watchlist is successfully',
        build: () {
          when(mockSaveWatchlist.execute(dummyWatchlist)).thenAnswer(
            (_) async => const Right(watchlistAddSuccessMessage),
          );
          when(mockGetWatchListStatus.execute(dummyWatchlist.id)).thenAnswer(
            (_) async => const Right(true),
          );
          return watchlistBloc;
        },
        act: (bloc) {
          bloc.add(AddWatchlist(dummyWatchlist));
          bloc.add(CheckWatchlistStatus(dummyWatchlist.id ?? 0));
        },
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistMessage:
                const WatchlistMessage(watchlistAddSuccessMessage),
          ),
          WatchlistContainerState.initialState().copyWith(
            watchlistStatus: const WatchlistStatus(true),
            watchlistMessage:
                const WatchlistMessage(watchlistAddSuccessMessage),
          ),
        ],
        verify: (bloc) {
          verify(
            mockSaveWatchlist.execute(dummyWatchlist),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Error] when add watchlist is unsuccessful',
        build: () {
          when(mockSaveWatchlist.execute(dummyWatchlist)).thenAnswer(
            (_) async => const Left(
              DatabaseFailure("Can't get data"),
            ),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(AddWatchlist(dummyWatchlist)),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistError("Can't get data"),
          ),
        ],
        verify: (bloc) {
          verify(
            mockSaveWatchlist.execute(dummyWatchlist),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [HasData] when remove watchlist is successfully',
        build: () {
          when(mockRemoveWatchlist.execute(dummyWatchlist)).thenAnswer(
            (_) async => const Right(watchlistRemoveSuccessMessage),
          );
          when(mockGetWatchListStatus.execute(dummyWatchlist.id)).thenAnswer(
            (_) async => const Right(false),
          );
          return watchlistBloc;
        },
        act: (bloc) {
          bloc.add(RemoveWatchlist(dummyWatchlist));
          bloc.add(CheckWatchlistStatus(dummyWatchlist.id ?? 0));
        },
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistMessage:
                const WatchlistMessage(watchlistRemoveSuccessMessage),
          ),
        ],
        verify: (bloc) {
          verify(
            mockRemoveWatchlist.execute(dummyWatchlist),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Error] when remove watchlist is unsuccessful',
        build: () {
          when(mockRemoveWatchlist.execute(dummyWatchlist)).thenAnswer(
            (_) async => const Left(
              DatabaseFailure("Can't remove data"),
            ),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlist(dummyWatchlist)),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistError("Can't remove data"),
          ),
        ],
        verify: (bloc) {
          verify(
            mockRemoveWatchlist.execute(dummyWatchlist),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [HasData] when check status watchlist is successfully',
        build: () {
          when(mockGetWatchListStatus.execute(dummyWatchlist.id)).thenAnswer(
            (_) async => const Right(true),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(CheckWatchlistStatus(dummyWatchlist.id ?? 0)),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistStatus: const WatchlistStatus(true),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetWatchListStatus.execute(dummyWatchlist.id),
          );
        },
      );

      blocTest<WatchlistBloc, WatchlistContainerState>(
        'Should emit [Error] when check status watchlist is unsuccessful',
        build: () {
          when(mockGetWatchListStatus.execute(dummyWatchlist.id)).thenAnswer(
            (_) async => const Left(
              DatabaseFailure("Can't check status data"),
            ),
          );
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(CheckWatchlistStatus(dummyWatchlist.id ?? 0)),
        expect: () => [
          WatchlistContainerState.initialState().copyWith(
            watchlistState: WatchlistError("Can't check status data"),
          ),
        ],
        verify: (bloc) {
          verify(
            mockGetWatchListStatus.execute(dummyWatchlist.id),
          );
        },
      );

      tearDown(() => watchlistBloc.close());
    },
  );
}
