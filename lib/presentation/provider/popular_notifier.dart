import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class PopularNotifier extends ChangeNotifier {
  final GetPopularMovies getPopularMovies;
  final GetPopularTvShows getPopularTvShows;

  PopularNotifier(this.getPopularMovies, this.getPopularTvShows);

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<category.Category> _data = [];
  List<category.Category> get data => _data;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularMovies() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getPopularMovies.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (moviesData) {
        _data = moviesData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvShows() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getPopularTvShows.execute();

    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (tvShowsData) {
      _data = tvShowsData;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
