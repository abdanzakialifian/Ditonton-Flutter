part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
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
  final DetailState recommendationState;

  DetailData(this.detail, this.recommendationState);

  @override
  List<Object?> get props => [detail];
}

class RecommendationLoading extends DetailState {}

class RecommendationEmpty extends DetailState {}

class RecommendationError extends DetailState {
  final String message;

  RecommendationError(this.message);

  @override
  List<Object?> get props => [message];
}

class RecommendationData extends DetailState {
  final List<Category> recommendations;

  RecommendationData(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}
