import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/foundation.dart';

class TvShowNotifier extends ChangeNotifier {
  List<TvShow> _nowPlayingTvShows = <TvShow>[];
  List<TvShow> get nowPlayingTvShows => _nowPlayingTvShows;

  RequestState _nowPlayingTvShowsState = RequestState.Empty;
  RequestState get nowPlayingTvShowsState => _nowPlayingTvShowsState;

  List<TvShow> _popularTvShows = <TvShow>[];
  List<TvShow> get popularTvShows => _popularTvShows;

  RequestState _popularTvShowsState = RequestState.Empty;
  RequestState get popularTvShowsState => _popularTvShowsState;

  List<TvShow> _topRatedTvShows = <TvShow>[];
  List<TvShow> get topRatedTvShows => _topRatedTvShows;

  RequestState _topRatedTvShowsState = RequestState.Empty;
  RequestState get topRatedTvShowsState => _topRatedTvShowsState;

  String _message = "";
  String get message => _message;

  final GetAiringTodayTvShows getAiringTodayTvShows;
  final GetPopularTvShows getPopularTvShows;
  final GetTopRatedTvShows getTopRatedTvShows;

  TvShowNotifier({
    required this.getAiringTodayTvShows,
    required this.getPopularTvShows,
    required this.getTopRatedTvShows,
  });

  Future<void> fetchAiringTodayTvShows() async {
    _nowPlayingTvShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayTvShows.execute();
    result.fold((failure) {
      _nowPlayingTvShowsState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _nowPlayingTvShowsState = RequestState.Loaded;
      _nowPlayingTvShows = tvShowsData;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTvShows() async {
    _popularTvShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvShows.execute();
    result.fold((failure) {
      _popularTvShowsState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _popularTvShowsState = RequestState.Loaded;
      _popularTvShows = tvShowsData;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTvShows() async {
    _topRatedTvShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvShows.execute();
    result.fold((failure) {
      _topRatedTvShowsState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _topRatedTvShowsState = RequestState.Loaded;
      _topRatedTvShows = tvShowsData;
      notifyListeners();
    });
  }
}
