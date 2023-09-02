part of 'watchlist_bloc.dart';

class WatchlistState {
  final ChildWatchlistState childWatchlistState;
  final WatchlistMessage watchlistMessage;
  final WatchlistStatus watchlistStatus;

  WatchlistState({
    required this.childWatchlistState,
    required this.watchlistMessage,
    required this.watchlistStatus,
  });

  WatchlistState copyWith({
    ChildWatchlistState? childWatchlistState,
    WatchlistMessage? watchlistMessage,
    WatchlistStatus? watchlistStatus,
  }) =>
      WatchlistState(
        childWatchlistState: childWatchlistState ?? this.childWatchlistState,
        watchlistMessage: watchlistMessage ?? this.watchlistMessage,
        watchlistStatus: watchlistStatus ?? this.watchlistStatus,
      );

  factory WatchlistState.initialState() => WatchlistState(
        childWatchlistState: WatchlistEmpty(),
        watchlistMessage: const WatchlistMessage(""),
        watchlistStatus: const WatchlistStatus(false),
      );
}

sealed class ChildWatchlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WatchlistLoading extends ChildWatchlistState {}

class WatchlistEmpty extends ChildWatchlistState {}

class WatchlistError extends ChildWatchlistState {
  final String message;

  WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class WatchlistData extends ChildWatchlistState {
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
