import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/detail_page.dart';
import 'package:ditonton/presentation/pages/home_page.dart';
import 'package:ditonton/presentation/pages/now_playing_page.dart';
import 'package:ditonton/presentation/pages/popular_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/season_page.dart';
import 'package:ditonton/presentation/pages/top_rated_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movie_page.dart';
import 'package:ditonton/presentation/pages/watchlist_tv_show_page.dart';
import 'package:ditonton/presentation/provider/detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_notifier.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:ditonton/presentation/provider/now_playing_notifier.dart';
import 'package:ditonton/presentation/provider/popular_notifier.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/locator/injection.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case NowPlayingPage.routeName:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => NowPlayingPage(
                  type: type,
                ),
                settings: settings,
              );
            case PopularPage.routeName:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => PopularPage(type: type),
                settings: settings,
              );
            case TopRatedPage.routeName:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => TopRatedPage(
                  type: type,
                ),
                settings: settings,
              );
            case DetailPage.routeName:
              final data = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                builder: (_) => DetailPage(
                  id: data[0],
                  type: data[1],
                ),
                settings: settings,
              );
            case SeasonPage.routeName:
              final data = settings.arguments as List<Season>;
              return MaterialPageRoute(
                builder: (context) => SeasonPage(seasons: data),
                settings: settings,
              );
            case SearchPage.routeName:
              final type = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => SearchPage(
                  type: type,
                ),
              );
            case WatchlistMoviePage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviePage());
            case WatchlistTvShowPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistTvShowPage());
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
