part of 'watchlist_bloc.dart';

sealed class WatchlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWatchlist extends WatchlistEvent {}

class AddWatchlist extends WatchlistEvent {
  final Watchlist watchlist;

  AddWatchlist(this.watchlist);

  @override
  List<Object?> get props => [watchlist];
}

class RemoveWatchlist extends WatchlistEvent {
  final Watchlist watchlist;

  RemoveWatchlist(this.watchlist);

  @override
  List<Object?> get props => [watchlist];
}

class CheckWatchlistStatus extends WatchlistEvent {
  final int id;

  CheckWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}
