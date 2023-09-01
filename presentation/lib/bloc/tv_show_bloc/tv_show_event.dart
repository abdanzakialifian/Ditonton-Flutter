part of 'tv_show_bloc.dart';

sealed class TvShowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAiringTodayTvShows extends TvShowEvent {}

class FetchPopularTvShows extends TvShowEvent {}

class FetchTopRatedTvShows extends TvShowEvent {}
