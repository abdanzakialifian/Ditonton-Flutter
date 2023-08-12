import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class PopularNotifier extends ChangeNotifier {
  final GetPopularMovies getPopularMovies;
  final GetPopularTvShows getPopularTvShows;

  PopularNotifier(this.getPopularMovies, this.getPopularTvShows);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<category.Category> _movies = [];
  List<category.Category> get movies => _movies;

  List<category.Category> _tvShows = [];
  List<category.Category> get tvShows => _tvShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularMovies.execute();

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

  Future<void> fetchPopularTvShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvShows.execute();

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
