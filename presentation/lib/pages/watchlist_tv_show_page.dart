import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

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
    context.read<WatchlistBloc>().add(FetchWatchlist());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchlistBloc>().add(FetchWatchlist());
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
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (_, state) {
        if (state.childWatchlistState is WatchlistLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.childWatchlistState is WatchlistData) {
          final mapWatchlist = (state.childWatchlistState as WatchlistData)
              .result
              .where((element) => element.category == tvShows)
              .toList();
          if (mapWatchlist.isNotEmpty) {
            return ListView.builder(
              itemCount: mapWatchlist.length,
              itemBuilder: (_, index) {
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
        } else if (state.childWatchlistState is WatchlistError) {
          final data = state.childWatchlistState as WatchlistError;
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
