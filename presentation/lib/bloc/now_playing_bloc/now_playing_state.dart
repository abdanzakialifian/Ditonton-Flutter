part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingEmpty extends NowPlayingState {}

class NowPlayingError extends NowPlayingState {
  final String message;

  NowPlayingError(this.message);

  @override
  List<Object?> get props => [message];
}

class NowPlayingData extends NowPlayingState {
  final List<Category> result;

  NowPlayingData(this.result);

  @override
  List<Object?> get props => [result];
}
