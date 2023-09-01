part of 'popular_bloc.dart';

sealed class PopularEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPopularMovies extends PopularEvent {}

class FetchPopularTvShows extends PopularEvent {}
