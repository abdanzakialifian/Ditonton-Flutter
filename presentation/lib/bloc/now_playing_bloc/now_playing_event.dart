part of 'now_playing_bloc.dart';

sealed class NowPlayingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNowPlayingMovies extends NowPlayingEvent {}

class FetchAiringTodayTvShows extends NowPlayingEvent {}
