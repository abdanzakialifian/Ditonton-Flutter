import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/domain/entities/category.dart' as category;

class NowPlayingNotifier extends ChangeNotifier {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetAiringTodayTvShows getAiringTodayTvShows;

  NowPlayingNotifier(this.getNowPlayingMovies, this.getAiringTodayTvShows);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<category.Category> _movies = [];
  List<category.Category> get movies => _movies;

  List<category.Category> _tvShows = [];
  List<category.Category> get tvShows => _tvShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingMovies() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingMovies.execute();

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

  Future<void> fetchAiringTodayTvShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayTvShows.execute();

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
