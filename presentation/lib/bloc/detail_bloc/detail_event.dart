part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovieDetail extends DetailEvent {
  final int movieId;

  FetchMovieDetail(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class FetchTvShowDetail extends DetailEvent {
  final int tvShowId;

  FetchTvShowDetail(this.tvShowId);

  @override
  List<Object?> get props => [tvShowId];
}
