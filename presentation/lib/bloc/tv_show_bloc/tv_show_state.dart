part of 'tv_show_bloc.dart';

class TvShowContainerState extends Equatable {
  final AiringTodayTvShowsState airingTodayTvShowsState;
  final PopularTvShowsState popularTvShowsState;
  final TopRatedTvShowsState topRatedTvShowsState;

  const TvShowContainerState({
    required this.airingTodayTvShowsState,
    required this.popularTvShowsState,
    required this.topRatedTvShowsState,
  });

  TvShowContainerState copyWith({
    AiringTodayTvShowsState? airingTodayTvShowsState,
    PopularTvShowsState? popularTvShowsState,
    TopRatedTvShowsState? topRatedTvShowsState,
  }) =>
      TvShowContainerState(
        airingTodayTvShowsState:
            airingTodayTvShowsState ?? this.airingTodayTvShowsState,
        popularTvShowsState: popularTvShowsState ?? this.popularTvShowsState,
        topRatedTvShowsState: topRatedTvShowsState ?? this.topRatedTvShowsState,
      );

  factory TvShowContainerState.initialState() => TvShowContainerState(
        airingTodayTvShowsState: AiringTodayTvShowsEmpty(),
        popularTvShowsState: PopularTvShowsEmpty(),
        topRatedTvShowsState: TopRatedTvShowsEmpty(),
      );

  @override
  List<Object?> get props => [
        airingTodayTvShowsState,
        popularTvShowsState,
        topRatedTvShowsState,
      ];
}

sealed class AiringTodayTvShowsState extends Equatable {
  @override
  List<Object?> get props => [];
}

sealed class PopularTvShowsState extends Equatable {
  @override
  List<Object?> get props => [];
}

sealed class TopRatedTvShowsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AiringTodayTvShowsLoading extends AiringTodayTvShowsState {}

class AiringTodayTvShowsEmpty extends AiringTodayTvShowsState {}

class AiringTodayTvShowsError extends AiringTodayTvShowsState {
  final String message;

  AiringTodayTvShowsError(this.message);

  @override
  List<Object?> get props => [message];
}

class AiringTodayTvShowsData extends AiringTodayTvShowsState {
  final List<Category> result;

  AiringTodayTvShowsData(this.result);

  @override
  List<Object?> get props => [result];
}

class PopularTvShowsLoading extends PopularTvShowsState {}

class PopularTvShowsEmpty extends PopularTvShowsState {}

class PopularTvShowsError extends PopularTvShowsState {
  final String message;

  PopularTvShowsError(this.message);

  @override
  List<Object?> get props => [message];
}

class PopularTvShowsData extends PopularTvShowsState {
  final List<Category> result;

  PopularTvShowsData(this.result);

  @override
  List<Object?> get props => [result];
}

class TopRatedTvShowsLoading extends TopRatedTvShowsState {}

class TopRatedTvShowsEmpty extends TopRatedTvShowsState {}

class TopRatedTvShowsError extends TopRatedTvShowsState {
  final String message;

  TopRatedTvShowsError(this.message);

  @override
  List<Object?> get props => [message];
}

class TopRatedTvShowsData extends TopRatedTvShowsState {
  final List<Category> result;

  TopRatedTvShowsData(this.result);

  @override
  List<Object?> get props => [result];
}
