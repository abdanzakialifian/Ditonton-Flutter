import 'package:core/utils/state_enum.dart';
import 'package:core/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:core/domain/usecases/get_popular_tv_shows.dart';
import 'package:core/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter/foundation.dart';
import 'package:core/domain/entities/category.dart' as category;

class TvShowNotifier extends ChangeNotifier {
  List<category.Category> _airingTodayTvShows = <category.Category>[];
  List<category.Category> get airingTodayTvShows => _airingTodayTvShows;

  RequestState _airingTodayTvShowsState = RequestState.empty;
  RequestState get airingTodayTvShowsState => _airingTodayTvShowsState;

  List<category.Category> _popularTvShows = <category.Category>[];
  List<category.Category> get popularTvShows => _popularTvShows;

  RequestState _popularTvShowsState = RequestState.empty;
  RequestState get popularTvShowsState => _popularTvShowsState;

  List<category.Category> _topRatedTvShows = <category.Category>[];
  List<category.Category> get topRatedTvShows => _topRatedTvShows;

  RequestState _topRatedTvShowsState = RequestState.empty;
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
    _airingTodayTvShowsState = RequestState.loading;
    notifyListeners();

    final result = await getAiringTodayTvShows.execute();
    result.fold((failure) {
      _airingTodayTvShowsState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _airingTodayTvShowsState = RequestState.loaded;
      _airingTodayTvShows = tvShowsData;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTvShows() async {
    _popularTvShowsState = RequestState.loading;
    notifyListeners();

    final result = await getPopularTvShows.execute();
    result.fold((failure) {
      _popularTvShowsState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _popularTvShowsState = RequestState.loaded;
      _popularTvShows = tvShowsData;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTvShows() async {
    _topRatedTvShowsState = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedTvShows.execute();
    result.fold((failure) {
      _topRatedTvShowsState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvShowsData) {
      _topRatedTvShowsState = RequestState.loaded;
      _topRatedTvShows = tvShowsData;
      notifyListeners();
    });
  }
}
