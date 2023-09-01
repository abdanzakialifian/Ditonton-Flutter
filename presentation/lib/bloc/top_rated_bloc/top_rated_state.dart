part of 'top_rated_bloc.dart';

sealed class TopRatedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopRatedLoading extends TopRatedState {}

class TopRatedEmpty extends TopRatedState {}

class TopRatedError extends TopRatedState {
  final String message;

  TopRatedError(this.message);

  @override
  List<Object?> get props => [message];
}

class TopRatedData extends TopRatedState {
  final List<Category> result;

  TopRatedData(this.result);

  @override
  List<Object?> get props => [result];
}
