part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnQueryChangedFetchMovies extends SearchEvent {
  final String query;

  OnQueryChangedFetchMovies(this.query);

  @override
  List<Object?> get props => [query];
}

class OnQueryChangedFetchTvShows extends SearchEvent {
  final String query;

  OnQueryChangedFetchTvShows(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearResultList extends SearchEvent {
  @override
  List<Object?> get props => [];
}
