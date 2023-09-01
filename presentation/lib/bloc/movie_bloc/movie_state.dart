part of 'movie_bloc.dart';

class MovieState {
  final NowPlayingMoviesState nowPlayingMoviesState;
  final PopularMoviesState popularMoviesState;
  final TopRatedMoviesState topRatedMoviesState;

  const MovieState({
    required this.nowPlayingMoviesState,
    required this.popularMoviesState,
    required this.topRatedMoviesState,
  });

  MovieState copyWith({
    NowPlayingMoviesState? nowPlayingMoviesState,
    PopularMoviesState? popularMoviesState,
    TopRatedMoviesState? topRatedMoviesState,
  }) =>
      MovieState(
        nowPlayingMoviesState:
            nowPlayingMoviesState ?? this.nowPlayingMoviesState,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      );

  factory MovieState.initialState() => MovieState(
        nowPlayingMoviesState: NowPlayingMoviesEmpty(),
        popularMoviesState: PopularMoviesEmpty(),
        topRatedMoviesState: TopRatedMoviesEmpty(),
      );
}

sealed class NowPlayingMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

sealed class PopularMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

sealed class TopRatedMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesEmpty extends NowPlayingMoviesState {}

class NowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;

  NowPlayingMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}

class NowPlayingMoviesData extends NowPlayingMoviesState {
  final List<Category> result;

  NowPlayingMoviesData(this.result);

  @override
  List<Object?> get props => [result];
}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesEmpty extends PopularMoviesState {}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}

class PopularMoviesData extends PopularMoviesState {
  final List<Category> result;

  PopularMoviesData(this.result);

  @override
  List<Object?> get props => [result];
}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesEmpty extends TopRatedMoviesState {}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  TopRatedMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}

class TopRatedMoviesData extends TopRatedMoviesState {
  final List<Category> result;

  TopRatedMoviesData(this.result);

  @override
  List<Object?> get props => [result];
}
