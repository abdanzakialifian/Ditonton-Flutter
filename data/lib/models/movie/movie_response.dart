import 'package:data/models/movie/movie_result_response.dart';
import 'package:equatable/equatable.dart';

class MovieResponse extends Equatable {
  final List<MovieResultResponse>? movieList;

  const MovieResponse({required this.movieList});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<MovieResultResponse>.from(
          (json["results"] as List<dynamic>?)
                  ?.map((x) => MovieResultResponse.fromJson(x))
                  .where(
                    (element) =>
                        element.posterPath != null &&
                        element.overview?.isNotEmpty == true,
                  ) ??
              <MovieResultResponse>[],
        ),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList?.map((x) => x.toJson()) ?? []),
      };

  @override
  List<Object?> get props => [movieList];
}
