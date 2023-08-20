import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/presentation/pages/detail_page.dart';
import 'package:core/presentation/pages/home_page.dart';
import 'package:core/presentation/pages/now_playing_page.dart';
import 'package:core/presentation/pages/popular_page.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:core/presentation/pages/season_page.dart';
import 'package:core/presentation/pages/top_rated_page.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:core/presentation/provider/detail_notifier.dart';
import 'package:core/presentation/provider/movie_notifier.dart';
import 'package:core/presentation/provider/search_notifier.dart';
import 'package:core/presentation/provider/now_playing_notifier.dart';
import 'package:core/presentation/provider/popular_notifier.dart';
import 'package:core/presentation/provider/top_rated_notifier.dart';
import 'package:core/presentation/provider/tv_show_notifier.dart';
import 'package:core/presentation/provider/watchlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/locator/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<DetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<SearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvShowNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Ditonton',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case homePageRoute:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case nowPlayingPageRoute:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => NowPlayingPage(
                  type: type,
                ),
                settings: settings,
              );
            case popularPageRoute:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => PopularPage(type: type),
                settings: settings,
              );
            case topRatedPageRoute:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => TopRatedPage(
                  type: type,
                ),
                settings: settings,
              );
            case detailPageRoute:
              final data = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                builder: (_) => DetailPage(
                  id: data[0],
                  type: data[1],
                ),
                settings: settings,
              );
            case seasonPageRoute:
              final data = settings.arguments as List<Season>;
              return MaterialPageRoute(
                builder: (context) => SeasonPage(seasons: data),
                settings: settings,
              );
            case searchPageRoute:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => SearchPage(
                  type: type,
                ),
              );
            case watchlistPageRoute:
              return MaterialPageRoute(builder: (_) => const WatchlistPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
