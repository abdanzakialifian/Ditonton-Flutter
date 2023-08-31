import 'package:data/datasources/local/db/database_helper.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/datasources/local/local_data_source_impl.dart';
import 'package:data/datasources/remote/network_http_client.dart';
import 'package:data/datasources/remote/remote_data_source.dart';
import 'package:data/datasources/remote/remote_data_source_impl.dart';
import 'package:data/repositories/movie_repository_impl.dart';
import 'package:data/repositories/tv_show_repository_impl.dart';
import 'package:data/repositories/watchlist_repository_impl.dart';
import 'package:domain/repositories/movie_repository.dart';
import 'package:domain/repositories/tv_show_repository.dart';
import 'package:domain/repositories/watchlist_repository.dart';
import 'package:domain/usecases/get_airing_today_tv_shows.dart';
import 'package:domain/usecases/get_movie_detail.dart';
import 'package:domain/usecases/get_movie_recommendations.dart';
import 'package:domain/usecases/get_now_playing_movies.dart';
import 'package:domain/usecases/get_popular_movies.dart';
import 'package:domain/usecases/get_popular_tv_shows.dart';
import 'package:domain/usecases/get_top_rated_movies.dart';
import 'package:domain/usecases/get_top_rated_tv_shows.dart';
import 'package:domain/usecases/get_tv_show_detail.dart';
import 'package:domain/usecases/get_tv_show_recommendations.dart';
import 'package:domain/usecases/get_watchlist.dart';
import 'package:domain/usecases/get_watchlist_status.dart';
import 'package:domain/usecases/remove_watchlist.dart';
import 'package:domain/usecases/save_watchlist.dart';
import 'package:domain/usecases/search_movies.dart';
import 'package:domain/usecases/search_tv_shows.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/provider/detail_notifier.dart';
import 'package:presentation/provider/movie_notifier.dart';
import 'package:presentation/provider/now_playing_notifier.dart';
import 'package:presentation/provider/popular_notifier.dart';
import 'package:presentation/provider/search_notifier.dart';
import 'package:presentation/provider/top_rated_notifier.dart';
import 'package:presentation/provider/tv_show_notifier.dart';
import 'package:presentation/provider/watchlist_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => DetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getTvShowDetail: locator(),
      getTvShowRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchNotifier(
      searchMovies: locator(),
      searchTvShows: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistNotifier(
      getWatchlist: locator(),
      getWatchListStatus: locator(),
      removeWatchlist: locator(),
      saveWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingNotifier(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularNotifier(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedNotifier(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowNotifier(
      getAiringTodayTvShows: locator(),
      getPopularTvShows: locator(),
      getTopRatedTvShows: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlist(locator()));
  locator.registerLazySingleton(() => GetAiringTodayTvShows(locator()));
  locator.registerLazySingleton(() => GetPopularTvShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvShows(locator()));
  locator.registerLazySingleton(() => GetTvShowRecommendations(locator()));
  locator.registerLazySingleton(() => GetTvShowDetail(locator()));
  locator.registerLazySingleton(() => SearchTvShows(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<TvShowRepository>(
    () => TvShowRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(locator()),
  );

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() {
    return NetworkHttpClient().httpClient();
  });
}