part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchData extends SearchState {
  final List<Category> result;

  SearchData(this.result);

  @override
  List<Object?> get props => [result];
}
