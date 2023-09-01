part of 'popular_bloc.dart';

sealed class PopularState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopularLoading extends PopularState {}

class PopularEmpty extends PopularState {}

class PopularError extends PopularState {
  final String message;

  PopularError(this.message);

  @override
  List<Object?> get props => [message];
}

class PopularData extends PopularState {
  final List<Category> result;

  PopularData(this.result);

  @override
  List<Object?> get props => [result];
}
