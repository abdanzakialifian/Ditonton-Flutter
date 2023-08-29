import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:ditonton/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistPage({Key? key}) : super(key: key);

  @override
  WatchlistPageState createState() => WatchlistPageState();
}

class WatchlistPageState extends State<WatchlistPage> with RouteAware {
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
          title: const Text('Watchlist'),
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
      builder: (context, data, child) {
        if (data.watchlistState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistState == RequestState.loaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final watchlist = data.watchlist[index];
              return CategoryCardItem(
                category: Category.fromWatchlist(watchlist),
                type: watchlist.category ?? "",
              );
            },
            itemCount: data.watchlist.length,
          );
        } else {
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
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
