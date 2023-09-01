part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNowPlayingMovies extends MovieEvent {}

class FetchPopularMovies extends MovieEvent {}

class FetchTopRatedMovies extends MovieEvent {}
