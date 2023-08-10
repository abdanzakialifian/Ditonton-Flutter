import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/foundation.dart';

class TopRatedNotifier extends ChangeNotifier {
  final GetTopRatedMovies getTopRatedMovies;
  final GetTopRatedTvShows getTopRatedTvShows;

  TopRatedNotifier(this.getTopRatedMovies, this.getTopRatedTvShows);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  List<TvShow> _tvShows = [];
  List<TvShow> get tvShows => _tvShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedMovies.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (moviesData) {
        _movies = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvShows() async {
    _state = RequestState.Loaded;
    notifyListeners();

    final result = await getTopRatedTvShows.execute();

    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (tvShowsData) {
      _tvShows = tvShowsData;
      _state = RequestState.Loaded;
      notifyListeners();
    });
  }
}
