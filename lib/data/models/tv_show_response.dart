import 'package:ditonton/data/models/tv_show_result_response.dart';
import 'package:equatable/equatable.dart';

class TvShowResponse extends Equatable {
  final List<TvShowResultResponse> tvShowList;

  TvShowResponse({required this.tvShowList});

  factory TvShowResponse.fromJson(Map<String, dynamic> json) => TvShowResponse(
        tvShowList: List<TvShowResultResponse>.from(
          (json["results"] as List)
              .map((x) => TvShowResultResponse.fromJson(x))
              .where((element) => element.posterPath != null),
        ),
      );

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(tvShowList.map((x) => x.toJson()))};

  @override
  List<Object?> get props => [tvShowList];
}
