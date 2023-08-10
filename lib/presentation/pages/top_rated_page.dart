import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_item.dart';
import 'package:ditonton/presentation/widgets/tv_show_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-movie';
  final String? type;

  const TopRatedPage({Key? key, required this.type}) : super(key: key);

  @override
  _TopRatedPageState createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  void initState() {
    super.initState();
    if (widget.type == MOVIES) {
      Future.microtask(
        () => Provider.of<TopRatedNotifier>(context, listen: false)
            .fetchTopRatedMovies(),
      );
    } else {
      Future.microtask(
        () => Provider.of<TopRatedNotifier>(context, listen: false)
            .fetchTopRatedTvShows(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == MOVIES ? 'Top Rated Movies' : 'Top Rated Tv Shows',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0), child: _setUpList(widget.type)),
    );
  }

  Widget _setUpList(String? type) {
    if (type == MOVIES) {
      return Consumer<TopRatedNotifier>(
        builder: (context, data, child) {
          if (data.state == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.state == RequestState.Loaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = data.movies[index];
                return MovieCardItem(movie);
              },
              itemCount: data.movies.length,
            );
          } else {
            return Center(
              key: Key('error_message'),
              child: Text(data.message),
            );
          }
        },
      );
    } else {
      return Consumer<TopRatedNotifier>(
        builder: (context, data, child) {
          if (data.state == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.state == RequestState.Loaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvShow = data.tvShows[index];
                return TvShowCardItem(tvShow);
              },
              itemCount: data.tvShows.length,
            );
          } else {
            return Center(
              key: Key('error_message'),
              child: Text(data.message),
            );
          }
        },
      );
    }
  }
}
