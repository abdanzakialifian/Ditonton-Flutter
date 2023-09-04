import 'package:data/datasources/local/db/database_helper.dart';
import 'package:data/datasources/local/local_data_source.dart';
import 'package:data/datasources/local/local_data_source_impl.dart';
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
import 'package:domain/usecases/save_watchlist.dart';
import 'package:domain/usecases/search_movies.dart';
import 'package:domain/usecases/search_tv_shows.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:presentation/bloc/now_playing_bloc/now_playing_bloc.dart';
import 'package:presentation/bloc/search_bloc/search_bloc.dart';
import 'package:presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:domain/usecases/remove_watchlist.dart' as watchlist;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => DetailBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => MovieBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => NowPlayingBloc(
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => PopularBloc(
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => SearchBloc(locator(), locator()),
  );

  locator.registerFactory(
    () => TopRatedBloc(locator(), locator()),
  );

  locator.registerFactory(
    () => TvShowBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistBloc(
      locator(),
      locator(),
      locator(),
      locator(),
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
  locator.registerLazySingleton(() => watchlist.RemoveWatchlist(locator()));
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
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
