import 'package:core/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchHasData extends SearchState {
  final List<Category> result;

  const SearchHasData({required this.result});

  @override
  List<Object?> get props => [result];
}
