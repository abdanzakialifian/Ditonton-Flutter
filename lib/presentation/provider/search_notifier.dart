import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class SearchNotifier extends ChangeNotifier {
  final SearchMovies searchMovies;
  final SearchTvShows searchTvShows;

  SearchNotifier({
    required this.searchMovies,
    required this.searchTvShows,
  });

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<category.Category> _searchResult = [];
  List<category.Category> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvShowSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTvShows.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  void clearSearchResult() {
    _searchResult.clear();
  }
}