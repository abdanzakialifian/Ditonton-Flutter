import 'package:ditonton/data/models/movie_result_response.dart';
import 'package:equatable/equatable.dart';

class MovieResponse extends Equatable {
  final List<MovieResultResponse> movieList;

  MovieResponse({required this.movieList});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<MovieResultResponse>.from((json["results"] as List)
            .map((x) => MovieResultResponse.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [movieList];
}
