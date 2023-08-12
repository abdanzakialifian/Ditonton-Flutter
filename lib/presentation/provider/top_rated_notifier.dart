import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class TopRatedNotifier extends ChangeNotifier {
  final GetTopRatedMovies getTopRatedMovies;
  final GetTopRatedTvShows getTopRatedTvShows;

  TopRatedNotifier(this.getTopRatedMovies, this.getTopRatedTvShows);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<category.Category> _movies = [];
  List<category.Category> get movies => _movies;

  List<category.Category> _tvShows = [];
  List<category.Category> get tvShows => _tvShows;

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
