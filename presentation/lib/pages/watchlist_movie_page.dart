import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

class WatchlistMoviePage extends StatefulWidget {
  static const routeName = '/watchlist-movie';

  const WatchlistMoviePage({Key? key}) : super(key: key);

  @override
  WatchlistMoviePageState createState() => WatchlistMoviePageState();
}

class WatchlistMoviePageState extends State<WatchlistMoviePage>
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
          title: const Text('Watchlist Movie'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _setUpWatchlist(),
        ),
      ),
    );
  }

  Widget _setUpWatchlist() {
    return BlocBuilder<WatchlistBloc, WatchlistContainerState>(
      builder: (_, state) {
        if (state.watchlistState is WatchlistLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.watchlistState is WatchlistData) {
          final mapWatchlist = (state.watchlistState as WatchlistData)
              .result
              .where((element) => element.category == movies)
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
                key: const Key('image_empty'),
              ),
            );
          }
        } else if (state.watchlistState is WatchlistError) {
          final data = state.watchlistState as WatchlistError;
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        } else {
          return Center(
            child: Image.asset(
              "assets/data_empty_image.png",
              height: 300,
              width: 300,
              key: const Key('image_empty'),
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
