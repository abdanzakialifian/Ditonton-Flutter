part of 'watchlist_bloc.dart';

class WatchlistContainerState extends Equatable {
  final WatchlistState watchlistState;
  final WatchlistMessage watchlistMessage;
  final WatchlistStatus watchlistStatus;

  const WatchlistContainerState({
    required this.watchlistState,
    required this.watchlistMessage,
    required this.watchlistStatus,
  });

  WatchlistContainerState copyWith({
    WatchlistState? watchlistState,
    WatchlistMessage? watchlistMessage,
    WatchlistStatus? watchlistStatus,
  }) =>
      WatchlistContainerState(
        watchlistState: watchlistState ?? this.watchlistState,
        watchlistMessage: watchlistMessage ?? this.watchlistMessage,
        watchlistStatus: watchlistStatus ?? this.watchlistStatus,
      );

  factory WatchlistContainerState.initialState() => WatchlistContainerState(
        watchlistState: WatchlistEmpty(),
        watchlistMessage: const WatchlistMessage(""),
        watchlistStatus: const WatchlistStatus(false),
      );

  @override
  List<Object?> get props => [
        watchlistState,
        watchlistMessage,
        watchlistStatus,
      ];
}

sealed class WatchlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WatchlistLoading extends WatchlistState {}

class WatchlistEmpty extends WatchlistState {}

class WatchlistError extends WatchlistState {
  final String message;

  WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class WatchlistData extends WatchlistState {
  final List<Watchlist> result;

  WatchlistData(this.result);

  @override
  List<Object?> get props => [result];
}

class WatchlistMessage extends Equatable {
  final String message;

  const WatchlistMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class WatchlistStatus extends Equatable {
  final bool isAdded;

  const WatchlistStatus(this.isAdded);

  @override
  List<Object?> get props => [isAdded];
}
