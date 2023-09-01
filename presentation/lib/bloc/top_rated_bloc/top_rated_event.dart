part of 'top_rated_bloc.dart';

sealed class TopRatedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTopRatedMovies extends TopRatedEvent {}

class FetchTopRatedTvShows extends TopRatedEvent {}
