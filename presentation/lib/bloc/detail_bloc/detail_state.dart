part of 'detail_bloc.dart';

class DetailContainerState {
  final DetailState detailState;
  final RecommendationState recommendationState;

  const DetailContainerState(
      {required this.detailState, required this.recommendationState});

  DetailContainerState copyWith(
          {DetailState? detailState,
          RecommendationState? recommendationState}) =>
      DetailContainerState(
        detailState: detailState ?? this.detailState,
        recommendationState: recommendationState ?? this.recommendationState,
      );

  factory DetailContainerState.initialState() => DetailContainerState(
        detailState: DetailEmpty(),
        recommendationState: RecommendationEmpty(),
      );
}

sealed class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

sealed class RecommendationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailLoading extends DetailState {}

class DetailEmpty extends DetailState {}

class DetailError extends DetailState {
  final String message;

  DetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class DetailData extends DetailState {
  final Detail detail;

  DetailData(this.detail);

  @override
  List<Object?> get props => [detail];
}

class RecommendationLoading extends RecommendationState {}

class RecommendationEmpty extends RecommendationState {}

class RecommendationError extends RecommendationState {
  final String message;

  RecommendationError(this.message);

  @override
  List<Object?> get props => [message];
}

class RecommendationData extends RecommendationState {
  final List<Category> recommendations;

  RecommendationData(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}
