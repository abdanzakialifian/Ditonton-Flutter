import 'package:core/utils/state_enum.dart';
import 'package:core/domain/usecases/get_top_rated_movies.dart';
import 'package:core/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:core/domain/entities/category.dart' as category;

class TopRatedNotifier extends ChangeNotifier {
  final GetTopRatedMovies getTopRatedMovies;
  final GetTopRatedTvShows getTopRatedTvShows;

  TopRatedNotifier(this.getTopRatedMovies, this.getTopRatedTvShows);

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<category.Category> _data = [];
  List<category.Category> get data => _data;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedMovies() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedMovies.execute();

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

  Future<void> fetchTopRatedTvShows() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedTvShows.execute();

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
