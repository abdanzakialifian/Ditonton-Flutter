import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:presentation/provider/watchlist_notifier.dart';
import 'package:presentation/widgets/category_card_item.dart';
import 'package:provider/provider.dart';

class WatchlistTvShowPage extends StatefulWidget {
  static const routeName = '/watchlist-tv-show';

  const WatchlistTvShowPage({Key? key}) : super(key: key);

  @override
  WatchlistTvShowPageState createState() => WatchlistTvShowPageState();
}

class WatchlistTvShowPageState extends State<WatchlistTvShowPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlist());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Provider.of<WatchlistNotifier>(context, listen: false).fetchWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist Tv Show'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _setUpWatchlist(),
        ),
      ),
    );
  }

  Widget _setUpWatchlist() {
    return Consumer<WatchlistNotifier>(
      builder: (_, data, __) {
        if (data.watchlistState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistState == RequestState.loaded) {
          final mapWatchlist = data.watchlist
              .where((element) => element.category == tvShows)
              .toList();
          if (mapWatchlist.isNotEmpty) {
            return ListView.builder(
              itemCount: mapWatchlist.length,
              itemBuilder: (context, index) {
                final watchlist = mapWatchlist[index];
                return CategoryCardItem(
                  category: Category.fromWatchlist(watchlist),
                  type: watchlist.category ?? "",
                );
              },
            );
          } else {
            return Center(
              child: Image.asset(
                "assets/data_empty_image.png",
                height: 300,
                width: 300,
              ),
            );
          }
        } else if (data.watchlistState == RequestState.error) {
          return Center(
            child: Text(data.message),
          );
        } else {
          return Center(
            child: Image.asset(
              "assets/data_empty_image.png",
              height: 300,
              width: 300,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
