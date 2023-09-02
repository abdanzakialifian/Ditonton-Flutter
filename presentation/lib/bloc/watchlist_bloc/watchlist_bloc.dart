import 'package:domain/entities/watchlist.dart';
import 'package:domain/usecases/get_watchlist.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/save_watchlist.dart';
import 'package:domain/usecases/remove_watchlist.dart' as watchlist;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistContainerState> {
  final GetWatchlist _getWatchlist;
  final GetWatchListStatus _getWatchListStatus;
  final watchlist.RemoveWatchlist _removeWatchlist;
  final SaveWatchlist _saveWatchlist;

  WatchlistBloc(
    this._getWatchlist,
    this._getWatchListStatus,
    this._removeWatchlist,
    this._saveWatchlist,
  ) : super(WatchlistContainerState.initialState()) {
    on<FetchWatchlist>(
      (event, emit) async {
        emit(
          state.copyWith(
            watchlistState: WatchlistLoading(),
          ),
        );

        final result = await _getWatchlist.execute();

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                watchlistState: WatchlistError(failure.message),
              ),
            );
          },
          (watchlistData) {
            if (watchlistData.isNotEmpty) {
              emit(
                state.copyWith(
                  watchlistState: WatchlistData(watchlistData),
                ),
              );
            } else {
              emit(
                state.copyWith(
                  watchlistState: WatchlistEmpty(),
                ),
              );
            }
          },
        );
      },
    );

    on<AddWatchlist>(
      (event, emit) async {
        final result = await _saveWatchlist.execute(event.watchlist);

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                watchlistState: WatchlistError(failure.message),
              ),
            );
          },
          (successMessage) {
            emit(
              state.copyWith(
                watchlistMessage: WatchlistMessage(successMessage),
              ),
            );

            add(CheckWatchlistStatus(event.watchlist.id ?? 0));
          },
        );
      },
    );

    on<RemoveWatchlist>(
      (event, emit) async {
        final result = await _removeWatchlist.execute(event.watchlist);

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                watchlistState: WatchlistError(failure.message),
              ),
            );
          },
          (successMessage) {
            emit(
              state.copyWith(
                watchlistMessage: WatchlistMessage(successMessage),
              ),
            );

            add(CheckWatchlistStatus(event.watchlist.id ?? 0));
          },
        );
      },
    );

    on<CheckWatchlistStatus>(
      (event, emit) async {
        final result = await _getWatchListStatus.execute(event.id);
        result.fold(
          (failure) {
            emit(
              state.copyWith(
                watchlistState: WatchlistError(failure.message),
              ),
            );
          },
          (isAdded) {
            emit(
              state.copyWith(
                watchlistStatus: WatchlistStatus(isAdded),
              ),
            );
          },
        );
      },
    );
  }
}
