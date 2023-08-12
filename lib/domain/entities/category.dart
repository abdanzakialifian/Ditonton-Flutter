import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? overview;
  final String? posterPath;
  final String? title;

  Category({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object?> get props => [
        id,
        overview,
        posterPath,
        title,
      ];
}
